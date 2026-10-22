---
name: designing-visuals
description: "Gives a screen its visual structure (focal point, hierarchy, spacing, alignment, type, contrast, colour) and checks it rendered on the device. Use whenever a screen, component or layout is designed, built or reviewed, even without a request for polish, or the user says it looks off, cramped, empty or misaligned. Not for words (writing-ux-copy) or flow structure (designing-flows)."
license: MIT
---

# Designing visuals

People judge a screen before they read it. In the first glance they decide what it is, where to look and whether it was made with care. Structure does that work: one focal point, a clear order of importance, related things grouped, one rhythm of space, and contrast where it matters and nowhere else. Restraint is not austerity. Screens people use every day stay plain and calm: white space, clear type and one accent, structured well, outclass any amount of styling. Rare moments (an empty state, a first run, a success) are where warmth belongs, designed in the product's own style. A screen that looks bare or unfinished fails the bar as surely as a cluttered one.

This skill arranges a given set of elements and checks that it renders that way; any change to which elements exist goes to `decluttering-screens`. The words come from `writing-ux-copy`, the sequence of screens from `designing-flows`, and anything that moves from `designing-motion`.

## Two failure modes, and the first is worse

1. **No structure.** Everything the same weight, so nothing leads: several things compete for attention, the primary action does not stand out, groups are unclear, edges wander. The person has to work out the screen before using it.
2. **Decoration instead of structure.** Lines, boxes, shadows, gradients and coloured tiles added to create order that space and type should create. The screen looks busy and cheap, and the important thing is still not obvious.

## Rules

**Hierarchy**
1. **One focal point and one primary action per screen.** If two things are equally loud when you squint, one comes down; the eye should never have to choose.
2. **Three levels of importance at most** (primary, secondary, tertiary), each clearly different in size, weight or tone. More levels read as noise.
3. **Hierarchy from size, weight and tone before colour or containers.** A quieter style separates more cleanly than a box, and costs no space.

**Space**
4. **Space makes the groups.** Space inside a group is clearly smaller than space between groups, on one 4 pt scale (4, 8, 12, 16, 24, 32, 48, 64). A value off the scale is the start of drift.
5. **Use space deliberately.** No large empty area beside a cramped one. A large screen gets more room around the same elements, not more of them; a small screen that cannot hold them goes to `decluttering-screens`. Margins are identical on every screen of the product.
6. **Nothing touches.** At least 16 pt between any control and the screen edge, clear space between the primary action and a progress bar or keyboard, and a deliberate gap between a title and its description.

**Alignment**
7. **One leading edge.** Everything aligns to it or to one clear grid. Centre only short, single-focus screens (welcome, success, empty) and then centre everything on them.
8. **Optical, not geometric.** A single-focus group sits at the optical centre, slightly above the middle, never below it. Icons, play glyphs and round shapes are nudged until they look centred.

**Type**
9. **A small type scale:** about five sizes on the platform's system font with semantic styles, one or two weights for emphasis, body at about 65 characters per line, tabular figures for numbers that change. A one-off size for one label is drift.

**Contrast and colour**
10. **Spend contrast on what matters.** Text meets 4.5:1 (3:1 for large text and marks) in light and dark. Above that minimum, the focal point and primary action get the most contrast and tertiary text the least. The primary action stands out on every background it sits on, in both themes.
11. **Colour has a job.** Neutral surfaces dominate, one accent marks the thing to press and selection, and semantic colours mark state. Colour never carries meaning alone.

**Shape and icons**
12. **One shape language.** One corner radius per element size, concentric when nested (inner radius = outer radius minus padding), one soft shadow from above, few and quiet separators.
13. **Groups must read as groups.** Grouped content sits on a fill clearly one step from its ground (white cards on a light grey, about 1.12:1, or the platform's grouped style), never a near-transparent tint the eye cannot see. Where a value is read at a glance (storage, progress, a quota), show it as a visual (a meter, a ring) with the figure beside it, not a line of numbers.
14. **One icon set,** one size per context, the same symbol for the same idea everywhere. An icon that needs explaining gets a short label.

**Composition**
15. **Fix composition by arranging, never by adding.** A crowded screen goes to `decluttering-screens` before any type shrinks. An empty-looking screen changes scale or placement instead of gaining filler. Sparse is fine; unresolved is not.
16. **Rare moments may be rich; everyday screens stay restrained.** Rich means one confident, well-composed moment (a crafted mark, the key figures, one action), not more things: a success screen crowded with extra cards, chips and stats is clutter however celebratory it looks. An empty state, a first run or a success can carry a crafted illustration or a larger symbol that explains the thing at a glance, drawn in the product's palette and style. The same decoration on a screen used every day is noise.
17. **Empty states give a head start.** Beside the one primary action, offer a quiet second way in: a template, an example, an import or a short list of starting points. The screen should feel like an invitation, not a dead end.
18. **Show the real surroundings.** A screen is designed and judged inside the product as it would be: navigation, sidebars and neighbouring areas populated with realistic content, not left as a wireframe around the part being designed.
19. **Render before done.** Judge the rendered screen on the device size it targets, in light and dark, at the smallest and largest supported size, with real and worst-case content. Code alone cannot show a layout problem. When the device or renderer is not available, say what was not verified rather than claim it.
20. **Density follows use.** A screen used all day by experts can be dense, as long as it stays aligned and legible; a screen met rarely or by newcomers is sparse, with one focal point. Decide which before setting the spacing.

## Method

1. **Name the focal point and the action** in one sentence. Rank everything else as secondary or tertiary; anything that is neither goes to `decluttering-screens`.
2. **Block the structure with space.** Group content by meaning, set the leading edge and grid, space groups on the scale.
3. **Set the type** by level from the scale. Check that the title fits one line at the smallest width.
4. **Add colour last:** neutral first, then the accent on the primary action and selection, then state colours. Check contrast in both themes.
5. **Render, then run the visual check:**
   - **Squint:** the eye lands on the focal point first and the action second.
   - **Groups:** visible without lines.
   - **Edges:** everything on the shared edges, nothing a point or two off.
   - **Space:** nothing cramped next to something empty; margins match the other screens; nothing touches.
   - **Centre:** single-focus content at the optical centre, not low.
   - **Contrast:** the primary action stands out in light and dark; no faint text.
   - **Count:** sizes, weights, colours, radii and icon styles on the screen. Could one go?
   - **Device:** designed for this device, not stretched from another.
6. **Detail pass:** hairlines are one device pixel; edges land on whole points so nothing blurs; text baselines line up across columns; radii are concentric; truncation and wrapping hold with the longest real content.
7. **Run the four tests:**
   - **Five seconds:** someone knows what the screen is and what to do.
   - **Subtraction:** removing any element would not improve it (if it would, hand it to `decluttering-screens`).
   - **Screenshot:** as one still image it looks exceptionally considered.
   - **System:** it belongs with the rest of the product without copying the previous screen.
8. **Score 1 to 5** on hierarchy, structure, spacing, type, contrast, colour, platform fit, interaction clarity and state craft. Nothing ships below 4; hierarchy, platform fit and interaction clarity reach 5. Where it falls short, hold it next to a screen doing the same job in an app known for its craft (Apple's own apps, Linear), measure the difference and fix it. Without the device or renderer, say which scores were not verified rather than claim them.

## Output

**For a design:** the rendered screen first, at the size it targets, then two or three lines on the structure (the focal point, the primary action, what was left out and why).

**For a review:** the rendered screen first, then findings grouped under High, Medium and Low, every one included, each with its fix as a value:

| What the eye sees | Fix |
| --- | --- |
| The primary button and the secondary link have the same weight | Secondary link to the tertiary tone, regular weight |
| 12 pt inside each card and 12 pt between cards | 12 inside, 24 between |

Then the scorecard.

## Gotchas

| Instead of | Do |
| --- | --- |
| The most probable, generic look (the template, the default AI aesthetic) | A point of view drawn from this product's brand and people |
| Cards inside cards, or a card for everything | A plain list or a section separated by space |
| Gradients or glows to say "AI" | The same calm surfaces as the rest of the product |
| Decoration on screens people use every day | Restraint there; illustration and warmth only in rare moments |
| An empty state that is just an icon, a line and a button | A crafted, inviting composition with a head start beside the primary action |
| Generic stock-style illustration | An illustration drawn in the product's own palette and style, explaining the thing |
| A desktop layout squeezed onto a phone | A layout designed for the phone |
| Filler to make a screen look full | A change of scale or placement |
| Content sitting low on a centred screen | The optical centre, slightly above the middle |
| A system dialog or permission prompt drawn off-centre | Where the platform places it, checked rendered |
| A grey that passes on white but fails on dark | Each tone checked on each ground |
| Group fills so faint the sections disappear | White on light grey, or the platform's grouped style |
| Shrinking type to fit more | `decluttering-screens` to cut or split |

## Works with

- `crafting-products`: the bar and terms this skill works to.
- `writing-ux-copy`: words and layout are one hierarchy; shorter copy makes room for structure. Run its check alongside this one.
- `designing-flows`: one mission per step is what makes one focal point possible.
- `designing-motion`: how elements arrive and leave.
- `decluttering-screens`: when there are too many elements to structure.
- `exploring-directions`: when the structure has more than one good answer.
- `auditing-consistency`: when spacing or alignment differs between screens.
- [../crafting-products/PLATFORMS.md](../crafting-products/PLATFORMS.md) holds type, materials and conventions per device.
- Apple's Human Interface Guidelines ("Layout", "Typography", "Color", "Materials"); Emil Kowalski's `apple-design` and `emil-design-eng`.
