# Guards that hold

Read this at step 3. A guard is what stops the next screen from reintroducing the answer you just deleted. Choose the strongest kind that can see the fault, write it before the fix, and watch it fail.

## The kinds, strongest first

1. **It no longer compiles.** Delete the variant, the prop or the value from the component's type. A caller asking for the old answer is a type error. This costs nothing to keep, and it is the first choice whenever the old answer was selected through the kit.
2. **A static lint over the source.** Use it for what the type system cannot see:
   - class patterns (a hover variant, a hand-typed colour, a literal duration)
   - imports of a retired module
   - markup that rebuilds the variant by hand
   - a literal where a token belongs

   It runs in the static gates on every commit.
3. **An audit of the rendered screen.** Use it for geometry and layout no source search can see: two buttons on one sheet at different heights, a heading with the wrong gap to its card, a mark off the centre line. It runs against the running product.
4. **A behaviour sweep.** Use it for what happens over time: a press that does not sink, a Back that cuts, a sheet that does not follow the finger. It drives the product and measures.
5. **A unit test.** Use it for logic: a formatter, a resolver, a rule that picks a state.

Combine kinds when the fault has more than one way back. A deleted prop (kind 1) does not stop someone hand-rolling the old markup, which needs kind 2.

## Writing one

- **Name it for the bug,** and open it with the fault that produced it, its date, and where it was seen. A later reader must be able to tell why it exists before deciding to delete it.
- **Fail on the old code first.** Run the new rule against a checkout of the base, not the working tree you are changing. Record how many offenders it lists, and check that number against your caller count.
- **Pass on the new code.**
- **Pass on everything it does not mean.** Run it across the whole tree, and read every hit. A rule that cries wolf teaches people to type its escape without thinking.
- **Make the escape visible.** If a real exception exists, the escape is a marker on the line that names its reason, so every exception is a decision someone can read.
- **Say what it cannot see.** A lint cannot see geometry, and an audit cannot see timing. Write the gap in the rule's header.

## Seeing it fail without disturbing other work

- Never use a bare stash in a shared repository to get back to the old code. Make a scratch worktree of the base (`git worktree add <scratch> origin/main`), copy the new rule into it, and run it there.
- Remove the scratch worktree when done.
- Report the count from the old code in the commit message, and in the pull request once the user says to open one: "fails 16 times on main, passes on this branch".

## Where a rule goes

Read the project's harness or checks documentation before adding a rule. A new rule goes in the script, and the manual part, that already own that kind of rule. A parallel check is a second answer to one job.

Run every gate (the static checks and the build) before committing. Never pipe a gate through `tail`, because the pipeline's exit code is then `tail`'s.
