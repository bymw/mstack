# Eval file format

One file per skill: `evals/<skill-name>.json`.

```json
{
  "skill": "designing-flows",
  "evals": [
    {
      "id": "designing-flows-1",
      "skills": ["designing-flows"],
      "query": "The exact message a user would send.",
      "files": ["evals/fixtures/designing-flows-1-signup.html"],
      "expected_behavior": [
        "One observable, checkable behaviour per line, judged from the output alone"
      ]
    }
  ],
  "trigger_checks": [
    { "query": "A prompt that should load this skill", "should_trigger": true },
    { "query": "A near-miss that belongs to a neighbouring skill", "should_trigger": false, "belongs_to": "designing-visuals" }
  ]
}
```

Rules for writing them:
- Three evals per skill, each a different kind of task the skill covers. Realistic, specific, self-contained.
- Products are neutral and invented (a notes app, a recipe app, a fitness tracker, a team calendar). No real companies, clients or people.
- Any input the task needs (a screen as HTML, a code file, a transcript, a spec) lives in `evals/fixtures/`, named `<eval-id>-<what>.<ext>`, and is small.
- 4 to 6 expected behaviours per eval, drawn from the skill's own rules and output section. Each is checkable from the output alone. At least two should be things a capable model without the skill would likely miss. One checks the output's structure.
- At least six trigger checks per skill: three that should trigger it, three near-misses that belong to a named neighbouring skill.
- No em dashes.
