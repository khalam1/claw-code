# Graph Report - /Users/tuhin/Documents/Repos/claw-code  (2026-07-19)

## Corpus Check
- Large corpus: 196 files · ~33,544,747 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 178 nodes · 240 edges · 36 communities (24 shown, 12 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 9 edges (avg confidence: 0.57)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_LLM Client & Chat|LLM Client & Chat]]
- [[_COMMUNITY_CLI Daemon Commands|CLI Daemon Commands]]
- [[_COMMUNITY_RunPod Deploy|RunPod Deploy]]
- [[_COMMUNITY_Custom Model Training|Custom Model Training]]
- [[_COMMUNITY_Package Config|Package Config]]
- [[_COMMUNITY_News Summarizer|News Summarizer]]
- [[_COMMUNITY_Calendar Briefing|Calendar Briefing]]
- [[_COMMUNITY_Instruction Dataset Builder|Instruction Dataset Builder]]
- [[_COMMUNITY_Knowledge Base Builder|Knowledge Base Builder]]
- [[_COMMUNITY_Calendar Events CRUD|Calendar Events CRUD]]
- [[_COMMUNITY_Start Script|Start Script]]
- [[_COMMUNITY_Model Download Script|Model Download Script]]
- [[_COMMUNITY_stop.sh|stop.sh]]
- [[_COMMUNITY_clear_metal_cache()|clear_metal_cache()]]
- [[_COMMUNITY_runpod-boot.sh|runpod-boot.sh]]
- [[_COMMUNITY_entrypoint.sh|entrypoint.sh]]
- [[_COMMUNITY_build-push-runpod.sh|build-push-runpod.sh]]
- [[_COMMUNITY_fuse-adapters.sh|fuse-adapters.sh]]
- [[_COMMUNITY_install-services.sh|install-services.sh]]
- [[_COMMUNITY_switch-model.sh|switch-model.sh]]
- [[_COMMUNITY_switch-openclaw-model.sh|switch-openclaw-model.sh]]
- [[_COMMUNITY_train-lora.sh|train-lora.sh]]
- [[_COMMUNITY_train-lora-chunked.sh|train-lora-chunked.sh]]
- [[_COMMUNITY_uninstall-services.sh|uninstall-services.sh]]
- [[_COMMUNITY_watch-training.sh|watch-training.sh]]
- [[_COMMUNITY_net.serenitybdd.startercucumber-starter|net.serenitybdd.starter:cucumber-starter]]

## God Nodes (most connected - your core abstractions)
1. `LLMClient` - 14 edges
2. `main()` - 9 edges
3. `generate_briefing()` - 9 edges
4. `summarize_news()` - 8 edges
5. `_graphql()` - 7 edges
6. `SimpleDataLoader` - 6 edges
7. `create_scheduler()` - 6 edges
8. `_load_events()` - 6 edges
9. `add_event()` - 6 edges
10. `list_events()` - 6 edges

## Surprising Connections (you probably didn't know these)
- `create_scheduler()` --indirect_call--> `generate_briefing()`  [INFERRED]
  engine/scheduler.py → engine/tasks/calendar.py
- `cmd_test_news()` --calls--> `summarize_news()`  [EXTRACTED]
  engine/main.py → engine/tasks/news.py
- `cmd_briefing()` --calls--> `generate_briefing()`  [EXTRACTED]
  engine/main.py → engine/tasks/calendar.py
- `cmd_list_events()` --calls--> `list_events()`  [EXTRACTED]
  engine/main.py → engine/tasks/calendar.py
- `cmd_list_week()` --calls--> `list_week()`  [EXTRACTED]
  engine/main.py → engine/tasks/calendar.py

## Import Cycles
- None detected.

## Communities (36 total, 12 thin omitted)

### Community 0 - "LLM Client & Chat"
Cohesion: 0.11
Nodes (16): load_conversation_context(), main(), Simple keyword-based retrieval from conversation index., LLMClient, _load_env(), _load_model_config(), _load_system_prompt(), Wrapper around llama-server, OpenAI, and Anthropic APIs.  Supports three backend (+8 more)

### Community 1 - "CLI Daemon Commands"
Cohesion: 0.16
Nodes (17): cmd_briefing(), cmd_daemon(), cmd_list_events(), cmd_list_week(), cmd_remove_event(), cmd_status(), cmd_test_news(), main() (+9 more)

### Community 2 - "RunPod Deploy"
Cohesion: 0.34
Nodes (13): check_health(), deploy(), _graphql(), load_config(), load_state(), main(), Call RunPod GraphQL API directly., Check if the llama-server health endpoint responds OK. (+5 more)

### Community 3 - "Custom Model Training"
Cohesion: 0.21
Nodes (9): evaluate(), loss_fn(), Minimal data loader that tokenizes on the fly., Compute cross-entropy loss for language modeling., Tokenize a dataset sample (which has 'messages' format)., Evaluate on validation set., SimpleDataLoader, tokenize_sample() (+1 more)

### Community 4 - "Package Config"
Cohesion: 0.17
Nodes (11): author, description, devDependencies, @playwright/test, @types/node, keywords, license, main (+3 more)

### Community 5 - "News Summarizer"
Cohesion: 0.27
Nodes (8): create_scheduler(), APScheduler setup for recurring Jarvis tasks., Create and configure the background scheduler with default jobs., fetch_headlines(), Fetch and summarize news from RSS feeds., Fetch headlines from RSS feeds. Returns list of (source, title, link)., Fetch headlines and summarize them via the LLM., summarize_news()

### Community 6 - "Calendar Briefing"
Cohesion: 0.29
Nodes (9): generate_briefing(), list_events(), list_week(), _load_events(), Simple JSON-based calendar/schedule manager., Load events from the JSON store., List events for a given date (default: today)., List events for the next 7 days. (+1 more)

### Community 7 - "Instruction Dataset Builder"
Cohesion: 0.36
Nodes (8): build_instruction_pairs(), extract_personal_knowledge(), extract_turns(), load_conversations(), main(), Extract conversations likely containing personal information.          Categorie, Walk the conversation tree and extract ordered (user, assistant) turn pairs., Convert conversations into instruction-tuning format.          Output format (co

### Community 8 - "Knowledge Base Builder"
Cohesion: 0.31
Nodes (8): build_system_prompt(), extract_key_facts(), extract_user_messages(), load_knowledge(), main(), Build a condensed system prompt with personal knowledge., Get all user messages grouped by category., Extract structured facts from conversation titles and user messages.

### Community 9 - "Calendar Events CRUD"
Cohesion: 0.25
Nodes (8): cmd_add_event(), Add a calendar event., add_event(), Save events to the JSON store., Add an event. date_str: YYYY-MM-DD, time_str: HH:MM., Remove an event by ID., remove_event(), _save_events()

### Community 10 - "Start Script"
Cohesion: 0.70
Nodes (4): set_default(), start.sh script, start_engine(), start_webui()

### Community 11 - "Model Download Script"
Cohesion: 0.83
Nodes (3): download_e2b(), download_e4b(), download-models.sh script

### Community 12 - "stop.sh"
Cohesion: 0.83
Nodes (3): kill_pid(), stop.sh script, wait_pid()

### Community 13 - "clear_metal_cache()"
Cohesion: 0.67
Nodes (3): clear_metal_cache(), main(), Aggressively clear Metal GPU cache to prevent OOM/watchdog.

## Knowledge Gaps
- **23 isolated node(s):** `name`, `version`, `main`, `scripts`, `keywords` (+18 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **12 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `LLMClient` connect `LLM Client & Chat` to `CLI Daemon Commands`, `News Summarizer`, `Calendar Briefing`?**
  _High betweenness centrality (0.051) - this node is a cross-community bridge._
- **Why does `summarize_news()` connect `News Summarizer` to `LLM Client & Chat`, `CLI Daemon Commands`?**
  _High betweenness centrality (0.010) - this node is a cross-community bridge._
- **Why does `generate_briefing()` connect `Calendar Briefing` to `LLM Client & Chat`, `CLI Daemon Commands`, `News Summarizer`?**
  _High betweenness centrality (0.009) - this node is a cross-community bridge._
- **Are the 7 inferred relationships involving `main()` (e.g. with `cmd_add_event()` and `cmd_briefing()`) actually correct?**
  _`main()` has 7 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Walk the conversation tree and extract ordered (user, assistant) turn pairs.`, `Convert conversations into instruction-tuning format.          Output format (co`, `Extract conversations likely containing personal information.          Categorie` to the rest of the system?**
  _68 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `LLM Client & Chat` be split into smaller, more focused modules?**
  _Cohesion score 0.11462450592885376 - nodes in this community are weakly interconnected._