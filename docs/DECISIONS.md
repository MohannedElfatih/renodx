# DECISIONS

Track important technical/process decisions so future work has clear context.

## Decision Record Template

```md
## YYYY-MM-DD - Title

* Status: proposed | accepted | superseded
* Context: <problem or trigger>
* Decision: <what we chose>
* Consequences:
  * Positive: <benefit>
  * Negative: <tradeoff>
* Related:
  * Tasks: `docs/TASKS.md`
  * Files: `<path>`
```

## 2026-03-15 - Add lightweight agent collaboration docs

* Status: accepted
* Context: Repo had build/contribution docs but no shared process for agent task tracking and session handoff.
* Decision: Add `AGENTS.md`, `docs/TASKS.md`, `docs/HANDOFF.md`, and `docs/DECISIONS.md` as a minimal operational docs set.
* Consequences:
  * Positive: Better continuity, clearer ownership, fewer repeated investigations.
  * Negative: Requires light maintenance to keep task/handoff entries current.
* Related:
  * Tasks: `docs/TASKS.md`
  * Files: `AGENTS.md`, `docs/HANDOFF.md`

## 2026-03-25 - Keep Vulkan Streamline work self-contained in `streamline_v2`

* Status: accepted
* Context: `dlssfix` already has a DX12-oriented Streamline path, but the requested Vulkan port is limited to `streamline_v2` and should not expand into raw NGX or broader ReShade-core changes in this pass.
* Decision: Implement Vulkan Streamline handle remapping and swapchain observation inside `src/utils/dlss/streamline_v2.hpp`, while leaving DX12 behavior and non-Streamline paths unchanged.
* Consequences:
  * Positive: Lower regression risk for existing DX12 `dlssfix` behavior and a smaller review surface.
  * Negative: Vulkan generated-frame isolation remains best-effort from the interposer layer and does not fully suppress ReShade present processing on its own.
* Related:
  * Tasks: `docs/TASKS.md`
  * Files: `src/utils/dlss/streamline_v2.hpp`

## 2026-04-19 - Cache Vulkan pipeline variants for upgraded render targets

* Status: accepted
* Context: `resource_upgrade` can restart a render pass with cloned color attachments whose formats no longer match the game's bound Vulkan graphics pipeline.
* Decision: Track Vulkan pipeline creation subobjects from `init_pipeline`, track current graphics binds from `bind_pipeline`, and lazily create/cache replacement pipelines keyed by the upgraded attachment formats when an upgraded render pass is active.
* Consequences:
  * Positive: Keeps original game pipelines intact and only binds replacement variants while drawing into upgraded render targets.
  * Negative: First use of each format variant creates a pipeline during command recording and still needs runtime validation under Vulkan validation layers.
* Related:
  * Tasks: `docs/TASKS.md`
  * Files: `src/utils/resource_upgrade.hpp`, `src/utils/pipeline.hpp`
