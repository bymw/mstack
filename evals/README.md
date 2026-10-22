# Evaluations

Each skill has a file here with three scenarios and six trigger checks. The format is in [FORMAT.md](FORMAT.md); input files live in [fixtures/](fixtures/).

## What they measure

| Check | Question it answers |
| --- | --- |
| Scenario, with the skill | Does the output show every expected behaviour? |
| Scenario, without the skill | How much of that does a strong model already do on its own? |
| Trigger check | Does each description pick its own requests and leave its neighbours' alone? |

A skill earns its place when it passes clearly more behaviours than the baseline, and its trigger checks land on the right skill.

## Running a scenario

1. Start a session with the skills installed (see the main README), in a scratch folder.
2. Send the scenario's `query`, attaching or pointing to its `files`.
3. Start a second session with no skills installed and send the same query.
4. Grade both outputs with the prompt below, one behaviour at a time.

```text
You are grading an output against expected behaviours. For each behaviour,
answer pass or fail and quote the line of the output that decides it.
A behaviour passes only if the output clearly shows it. Return JSON:
{"results": [{"behaviour": "...", "pass": true, "evidence": "..."}],
 "passed": <count>, "total": <count>}
```

## Running the trigger checks

Give a fresh session only the twenty skill names and descriptions, then each trigger query, and ask which skill it would load (or none). A check passes when a `should_trigger: true` query picks this skill, and a `should_trigger: false` query picks the neighbour named in `belongs_to` or none.

## Results

The latest run is recorded in [RESULTS.md](RESULTS.md).
