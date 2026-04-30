# AGENTS.md

This file defines how coding agents and humans should collaborate in this repository.

## Scope

These instructions apply to the entire repository unless a deeper `AGENTS.md` overrides them for a subdirectory.

## Skills

Use these specialized skills when their scope matches the task:

* [renodx-addon-development](/C:/Users/gaila/.codex/skills/renodx-addon-development/SKILL.md)
* [renodx-utilities-mods-development](/C:/Users/gaila/.codex/skills/renodx-utilities-mods-development/SKILL.md)
* [renodx-modern-apis](/C:/Users/gaila/.codex/skills/renodx-modern-apis/SKILL.md)
* [reshade-vulkan-addon-core](/C:/Users/gaila/.codex/skills/reshade-vulkan-addon-core/SKILL.md)

## Goals

1. Keep changes small, reviewable, and reversible.
2. Prefer root-cause fixes over one-off patches.
3. Preserve game/mod behavior unless a change explicitly targets behavior.

## Workflow

1. Understand context before editing:
   1. Read `README.md` and `docs/CONTRIBUTING.md` when onboarding.
   2. Read nearby code and existing patterns before introducing new ones.
2. Plan before large changes:
   1. State intended files and validation steps.
   2. Call out assumptions and risks.
3. Validate changes:
   1. Run the smallest relevant build/test/lint commands available.
   2. If validation cannot run, state exactly why.
4. Summarize outcomes:
   1. What changed and why.
   2. What was validated.
   3. What remains or needs follow-up.

## Editing Rules

1. Do not revert unrelated local changes.
2. Keep naming and style consistent with the touched area.
3. Prefer focused commits and avoid mixed refactors unless requested.
4. Add comments only when they explain non-obvious intent.

## Task Tracking

Use `docs/TASKS.md`:

1. Add new work in `Now`, `Next`, or `Later`.
2. Move completed work to `Done` with date and short note.
3. Link any meaningful decision to `docs/DECISIONS.md`.

## Handoff

For unfinished work, update `docs/HANDOFF.md` with:

1. Current status.
2. Files touched.
3. Exact next command(s) to run.
4. Blockers or assumptions.

## File Reference Convention

In agent/user writeups, reference files with clickable markdown links using absolute paths. Include line (and optional column) when useful.

Examples:

* `[AGENTS.md](/d:/GitHub/renodx/AGENTS.md)`
* `[swapchain_v2.hpp:42](/d:/GitHub/renodx/src/mods/swapchain_v2.hpp:42)`
* `[vulkan_hooks_swapchain.cpp:913](/d:/GitHub/reshade/source/vulkan/vulkan_hooks_swapchain.cpp:913)`
