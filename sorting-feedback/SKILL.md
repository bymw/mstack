---
name: sorting-feedback
description: Turns what people said (a transcript, meeting notes, a review, a partner call or a message thread) into a grounded action list in five groups (do now, ask, park, not doing, already handled), each with the line that raised it. Use when the user shares feedback and asks what to do with it or what someone is really asking. Not for designing or building the changes (getting-sign-off).
license: MIT
---

# Sorting feedback

Talking about something is not a decision to act on it. A transcript holds real problems, passing thoughts, misunderstandings, things already fixed, things already decided against, and things outside the scope. The value is in the sorting and the grounding, not in the list.

This skill covers deciding what to act on, and why. The changes are shown for sign-off with `getting-sign-off`; open choices go to `settling-decisions`; a reply to the person is written with `writing-briefs`.

## Two failure modes, and the first is worse

1. **Acting on everything said.** Building a passing idea, or a request that contradicts the product's truth, another stakeholder or the scope. That is scope creep with a straight face, and it erodes the plan that was agreed.
2. **Missing the real signal.** A quiet line that points at a real fault ("I wasn't sure it saved") buried under loud ones, or a polished answer to a question nobody asked, because the ask was never decoded.

## Rules

1. **Decode the ask first:** who is speaking and their expertise, and whether they pay for the product, use it, or both; what they actually asked, in their own words; what they need (a change, an answer, a document, a decision); and what would make them ask again. A specialist's word weighs most in their own field: a commercial lead on products and pricing, a partner on its own rules, a usability participant on their own confusion, not on the solution.
2. **Quote the line behind every item,** briefly, so it can be found again.
3. **Ground every item before sorting it:** in the running product (already true or already fixed?), the specification and decisions log (already decided, or contradicting a decision?), the outside world (the partner's real products, the provider's documentation, the rules that apply), and the scope.
4. **Sort into five groups,** each item with a one-line reason:
   - **Do now:** high value, high confidence, small or medium effort.
   - **Ask:** needs a decision or a fact we do not have; goes to `settling-decisions` or to the stakeholder.
   - **Park:** worth doing, not now; say what it waits for.
   - **Not doing:** said but not agreed, out of scope, or contradicting the product's truth.
   - **Already handled:** where it is true today.
5. **Small changes beat redesigns** unless a redesign was asked for: the change that clears the confusion with the least new surface.
6. **Count independent voices, and protect the people doing the work.** Note how many separate people raised each item; one loud voice is a lead, not a pattern. A request from a buyer or manager that makes the everyday user's work worse goes to Not doing or Ask, whoever asked.
7. **Align with a provider only where it holds for any provider.** Until a provider is chosen, change only what would be true of every provider of that kind.
8. **Write for someone in a hurry:** plain words, short lines, no system language. The reader may skim it on the way into a call.

## Method

1. **Read the whole source once.** Identify the speakers and their roles, and the context (sign-off session, usability round, partner call).
2. **Decode** in two or three sentences: "What's being asked". If the user wants help replying, this paragraph matters most.
3. **Extract** every candidate item, each with its quote and the screen or area it concerns.
4. **Ground** each item: open the product, read the spec and decisions, read primary sources for outside facts. Mark it already true, already fixed, contradicts a decision (cite which), needs a fact, or new.
5. **Score and sort:** value to the person or stakeholder, confidence that it is right, effort (S, M, L). Do now is high value, high confidence, small or medium effort (S or M). If Do now runs past about 15 items, the bar is too low: raise it and move the rest to Park, so nothing is dropped.
6. **Report, then offer the next step:** Do now becomes a `getting-sign-off` page for sign-off; Ask goes to `settling-decisions` or a short written question list; a reply, if asked, is drafted with `writing-briefs`.

## Output

**What's being asked:** two or three sentences.

**Do now,** biggest first:

| Change | Where | Why (the line) | Effort |
| --- | --- | --- | --- |

**Ask:** question · who decides · what it blocks
**Park:** item · what it waits for
**Not doing:** item · reason
**Already handled:** item · where it is true

## Gotchas

| Instead of | Do |
| --- | --- |
| Turning every sentence into a task | Sorting it; "Not doing" is a valid result |
| Acting on an item not checked against the product | Open it and look |
| Treating a specialist's statement as a guess | Weight it in their field; confirm the parts outside it |
| Inventing a fact the source did not give (a cost, a rule, a count) | Put it under Ask |
| Re-explaining what the stakeholder already knows | Lead with what is new or needs them |

## Works with

- `crafting-products`: truth before polish, and the shared terms.
- `getting-sign-off`: shows the Do-now items for sign-off.
- `settling-decisions`: settles the Ask items.
- `writing-briefs`: the reply to the stakeholder.
- `sequencing-bets`: Park items that compete for time.
