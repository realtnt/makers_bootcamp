# Level Two Web Application Starter Codebase

This is a starter codebase for building HTML web applications. It uses:

* `Ruby` (the language)
* `RSpec` (the testing tool)
* `Sinatra` (the web framework)
* `Capybara` (the web testing tool)

It comes with a design recipe in [`recipe/recipe.md`](recipe/recipe.md)

## Quickstart

```shell
; git clone git@github.com:makersacademy/web-starter-level-two.git
; cd web-starter-level-two
; bundle install
; rspec # To run the tests - all should pass
; rubocop # To verify code style
; rackup
# You should see something like this:
* Puma version: 5.6.4 (ruby 3.0.1-p64) ("Birdie's Version")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 60292
* Listening on http://127.0.0.1:9292
* Listening on http://[::1]:9292
Use Ctrl-C to stop
# This will then wait for requests indefinitely
# Try opening up another terminal and running:
; curl localhost:9292/animals
```

Take a look around `app.rb` and `feature/animals_feature_spec.rb` to see how
they work. Then open up `recipe/recipe.md` and get started.

