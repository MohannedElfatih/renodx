# TASKS

Lightweight project task board for active RenoDX work.

## Status Keys

* `todo` - Not started
* `doing` - In progress
* `blocked` - Waiting on dependency/input
* `done` - Completed and validated

## Now

* `[todo]` Add runtime validation notes for Vulkan DLSS-G titles using `dlssfix`
  * Owner: agent
  * Context: The Vulkan remap path now builds, but title-specific runtime confirmation is still needed for swapchain image tracking and Streamline tagging behavior.
  * Files: `src/utils/dlss/streamline_v2.hpp`, `src/utils/vulkan.hpp`
  * Validation: Manual runtime checks in a Vulkan DLSS-G title
  * Notes: Focus on `slSetVulkanInfo`, remapped `sl::Resource` logs, and `vkAcquireNextImage*` / `vkQueuePresentKHR` consistency.

## Next

* `[todo]` Example: Add regression test notes for shader injection pipeline

## Later

* `[todo]` Example: Document common decompilation command recipes

## Done

* `2026-04-28` `[done]` Fixed RenderPass Vulkan push descriptor updates for ReShade immediate command lists
  * Files: `src/utils/render.hpp`
  * Validation: `git diff --check -- src/utils/render.hpp docs/TASKS.md`; `cmake --build build --target smashbros-ultimate --config Debug` compiled `addon.cpp` after shader generation, then failed in resource compilation because `winver.h` was unavailable.
  * Notes: Vulkan generated descriptors now use one push-descriptor layout parameter per descriptor type, keeping pushed updates at binding 0 to satisfy ReShade's transient descriptor fallback.
* `2026-04-19` `[done]` Added Vulkan resource-upgrade pipeline/render-pass debug logs
  * Files: `src/utils/resource_upgrade.hpp`
  * Validation: `git diff --check -- src/utils/resource_upgrade.hpp docs/TASKS.md`; `cmake --build build --target nioh3 --config Release` reached C++ compile and then failed at resource compilation because `winver.h` was unavailable.
  * Notes: Logs upgraded render pass attachment formats, cloned pipeline creation, and replacement pipeline rebinds behind `DEBUG_LEVEL_2`.
* `2026-04-19` `[done]` Added Vulkan resource-upgrade pipeline variants for cloned render targets
  * Files: `src/utils/resource_upgrade.hpp`, `src/utils/pipeline.hpp`
  * Validation: `git diff --check -- src/utils/resource_upgrade.hpp src/utils/pipeline.hpp docs/TASKS.md`; `cmake --build build --target nioh3 --config Release` reached C++ compile and then failed at resource compilation because `winver.h` was unavailable.
  * Decision: `docs/DECISIONS.md`
* `2026-03-15` `[done]` Added shared collaboration docs (`AGENTS.md`, `docs/TASKS.md`, `docs/HANDOFF.md`, `docs/DECISIONS.md`)
* `2026-03-15` `[done]` Updated Vulkan RTV handling in `bind_render_targets_and_depth_stencil` to mutate RTV array in place (resource clone remap path)
* `2026-03-25` `[done]` Added Vulkan `streamline_v2` hooks for `slSetVulkanInfo`, Vulkan resource remap in tag APIs, and interposer-side swapchain tracking in `dlssfix`
* `2026-03-26` `[done]` Expanded Vulkan `dlssfix` remap path to rebuild full Streamline `sl::Resource` metadata, preserve Vulkan queue indices/families, and track acquired swapchain images

## Task Template

Copy this block for new tasks:

```md
* `[todo|doing|blocked|done]` Short task title
  * Owner: <name>
  * Context: <why this matters>
  * Files: `<path1>`, `<path2>`
  * Validation: <command(s) and/or manual checks>
  * Notes: <optional>
```
