# syntax=docker/dockerfile:1
# ═══════════════════════════════════════════════════════════
# Claw Code — Multi-stage Production Build
#
# Stage 1: Build Rust binaries (claw CLI + mock-anthropic-service)
# Stage 2: Lean runtime image with just the binaries
#
# Targets:
#   docker build --target cli -t claw:latest .
#   docker build --target mock-service -t claw-mock:latest .
# ═══════════════════════════════════════════════════════════

# ── Stage 1: Build ────────────────────────────────────────
FROM rust:bookworm AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates git libssl-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

# Cache dependencies: copy manifests and lock file, then fetch
COPY rust/Cargo.toml rust/Cargo.lock ./
COPY rust/crates/api/Cargo.toml crates/api/Cargo.toml
COPY rust/crates/commands/Cargo.toml crates/commands/Cargo.toml
COPY rust/crates/compat-harness/Cargo.toml crates/compat-harness/Cargo.toml
COPY rust/crates/mock-anthropic-service/Cargo.toml crates/mock-anthropic-service/Cargo.toml
COPY rust/crates/plugins/Cargo.toml crates/plugins/Cargo.toml
COPY rust/crates/runtime/Cargo.toml crates/runtime/Cargo.toml
COPY rust/crates/rusty-claude-cli/Cargo.toml crates/rusty-claude-cli/Cargo.toml
COPY rust/crates/telemetry/Cargo.toml crates/telemetry/Cargo.toml
COPY rust/crates/tools/Cargo.toml crates/tools/Cargo.toml

# Create minimal stub src files so cargo fetch can resolve the workspace
RUN for d in api commands compat-harness plugins runtime telemetry tools; do \
      mkdir -p "crates/$d/src" && echo "" > "crates/$d/src/lib.rs"; \
    done && \
    mkdir -p crates/rusty-claude-cli/src && echo "fn main(){}" > crates/rusty-claude-cli/src/main.rs && \
    mkdir -p crates/mock-anthropic-service/src && echo "fn main(){}" > crates/mock-anthropic-service/src/main.rs && \
    echo "" > crates/mock-anthropic-service/src/lib.rs

# Download all dependencies (cached unless Cargo.toml/lock changes)
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    cargo fetch

# Copy real source code and build from scratch
COPY rust/crates/ crates/
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    cargo build --release --workspace && \
    cp target/release/claw /usr/local/bin/claw && \
    cp target/release/mock-anthropic-service /usr/local/bin/mock-anthropic-service

# ── Stage 2a: CLI image (for running claw interactively) ──
FROM debian:bookworm-slim AS cli

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates git openssh-client curl jq \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/claw /usr/local/bin/claw

# Default workspace directory
WORKDIR /workspace
ENTRYPOINT ["claw"]

# ── Stage 2b: Mock Anthropic Service (for dev/test) ──────
FROM debian:bookworm-slim AS mock-service

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/mock-anthropic-service /usr/local/bin/mock-anthropic-service

EXPOSE 8088
ENTRYPOINT ["mock-anthropic-service"]
CMD ["--bind", "0.0.0.0:8088"]
