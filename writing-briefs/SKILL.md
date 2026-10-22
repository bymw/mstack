---
name: writing-briefs
description: "Explains work to a smart reader who is not technical (a leader, stakeholder or partner), recommendation first, in plain words with one visual: a brief, a reply or a deck outline, with no unconfirmed figures. Use when the user asks to explain something simply, write a one-pager, reply to someone or outline a deck. Not for deciding what to act on from feedback (sorting-feedback)."
license: MIT
---

# Writing briefs

The readers who decide are smart, busy and not engineers. They read the first lines and decide whether the rest matters. A brief that opens with the system, the history or the method loses them before the recommendation; one that leads with what we recommend, and why, in their words, gets an answer. Plain words rarely come in the first draft, and a recap the audience has already heard spends attention the recommendation needs.

This skill covers turning what we know into what the reader needs. It does not decide what to act on (`sorting-feedback`), ask the user's open questions (`settling-decisions`), or design a deck's look: a deck goes inside the user's own template. The three shapes (brief, reply, deck outline) and the word substitutions are in [SHAPES.md](SHAPES.md); read it before writing.

## Two failure modes, and the first is worse

1. **A confident wrong figure, or the answer to the wrong question.** A research count, cost, date or number nobody confirmed, on a page an executive will repeat; or a polished answer to what the reader did not ask. Either costs credibility that a plain "to confirm" would have kept.
2. **Written for us, not for them.** System language, history, method and caveats first, a wall of text, the recommendation at the end. The reader skims, asks again, or decides without reading.

## Rules

1. **Decode the ask first** with the method in `sorting-feedback`, in two sentences, and check it with the user when unsure.
2. **Recommendation first:** the answer and the one reason that matters most to this reader, in the first lines. Then an example, then the principle; background comes last, if at all.
3. **The reader's words.** No component, token, file, ticket or codename; no acronym they would not use. Plain international English, one idea per sentence, active voice, no intensifiers, no em dashes.
4. **Titles state the point.** Each title says what the section concludes ("The fix ships next week", "Nobody loses data"), so a reader who scans only the titles gets the story; never a bare label ("The fix") or a clever phrase to decode. An overview is followed by exactly the sections it names, in that order.
5. **One idea per section, and short.** A brief fits a screen; anything longer goes behind an appendix, a details block or a link.
6. **One visual that carries the argument:** a before and after, a simple diagram, a table of options, a real screen captured from the product. Never decoration.
7. **No recap of what they already know.** Lead with what is new or what needs them.
8. **Facts stay facts.** Every number has a source; anything unconfirmed is marked "to confirm" or left out, research counts above all. Where it matters, separate confirmed, hypothesis and open question.
9. **A deck is an outline first, then the user's template.** Agree the outline in text, then build the slides inside the template the user supplies; never invent the chrome or start slides before the template arrives.
10. **Open questions go in writing, after.** A live session covers what is decided and what needs the reader now; the rest is a written follow-up unless they ask otherwise.

## Method

1. **Decode** the ask (rule 1); then who will read it, what they already know, and what they will do with it. The first lines must settle what would make them ask again.
2. **Gather** the facts, each with its source, marking what is unconfirmed. Ask the user for what is missing with `settling-decisions`.
3. **Write the top:** the answer or recommendation in one or two sentences, then the one reason that matters most to this reader.
4. **Write the body:** one section per idea, each opening with its point; options in a table with exactly one recommended; risks and what we need from them in plain words.
5. **Cut** anything they know, any system word, any sentence that only shows our work. Read it aloud: if you would not say it across a table, rewrite it.
6. **Add the one visual.**
7. **Check:** every figure sourced or marked "to confirm"; the ask answered, not a neighbouring one; the first lines stand on their own; every title fits one line.
8. **Shape and deliver** as a brief, a reply or a deck outline. A brief for other people is published as a page and the link given; a reply is text ready to paste; a deck is an outline, then slides inside the template.

## Output

- **Brief:** the answer in two sentences, the reason, sections, one visual, "What we need from you", "To confirm".
- **Reply:** the decoded ask in one line (for the user only), then the reply, ready to paste.
- **Deck outline:** one line per slide (a title that states the point, and its one visual), the speaker's point, then what is parked for the written follow-up.

## Gotchas

| Instead of | Do |
| --- | --- |
| Opening with background, method or history | The answer or recommendation, first |
| A principle with no example | The example first, then the principle |
| A figure nobody confirmed | Sourced, marked "to confirm", or left out |
| Several recommendations | One, with its reason |
| Slides with invented chrome | The outline first, then the user's own template |
| A drawn mock of the product | A real capture |

## Works with

- `crafting-products`: truth before polish, for words as much as screens.
- `writing-ux-copy`: the same plain, precise voice.
- `sorting-feedback`: decoding and grounding what someone said before answering it.
- `settling-decisions`: the questions a brief cannot answer without the user.
- `getting-sign-off`: when the brief is a set of design changes for sign-off.
- `shaping-direction` and `sequencing-bets`: a direction or an order to explain to leaders.
