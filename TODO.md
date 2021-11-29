## OpenAPI Client

- Generate functional Ruby client
- Write script to auto-generate Ruby client and swagger docs (tie `bin/rails rswag` to `openapi-generator ...`)
- Try including client as submodule (goal: has it's own repo, but available directly in main repo)
- Generate functional Go client, rinse and repeat

## General

- Add POST score from `single-digits` to `stats-with-friends` 
- Differentiate between `User` (user of stats-with-friends) and `Player` (participant in a game)
  - A `User` may have many `Players`
  - A `Player` is not required to be a `User`
  - A `User` should have username/email, and can be associated to other accounts like Discord/Twitch
    - Accounts can be used for automated friend-discovery
    - Logins can be OAuthed via Accounts and create a `User`

## Dev Experience
- Consider byebug vs. pry
- [Improve `pry` usage](https://github.com/pry/pry#use-pry-as-your-rails-console) by making it rails console and add syntax highlighting
- Gem: [pry-nav](https://rubygems.org/gems/pry-nav/versions/0.3.0) adds 'step' and 'next' commands to control execution.
- Gem: [pry-rescue](https://rubygems.org/gems/pry-rescue/versions/1.5.2) allows you to wrap code in Pry::rescue{ } to open a pry session at any unhandled exceptions

## Dev Tools Improvements
- Auto-complete suggestions
  - LSP (`solargraph`)
  - Buffers?
  - Rails snippets? 
- Combined history across windows (so I can `history | grep 'foo'`)
- Try out `neoterm`

