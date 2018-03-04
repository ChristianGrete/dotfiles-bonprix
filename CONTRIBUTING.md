# Contributing to [dotfiles-bonprix][github-url]

## Getting started

This package depends on [dotfiles][github-dotfiles-url] and dotfiles-brew. Please make sure that all dependencies are properly installed.

### Download
As a collaborator, simply clone the repository from GitHub:
```sh
git clone git@github.com:ChristianGrete/dotfiles-bonprix.git
```

As a contributor, you must fork the repository. See the [GitHub documentation on forking a repo][github-fork-doc-url] for more details.

### Workflow
* Use [GitHub Flow][github-flow-guide-url] branching model and workflow
  * Create issues for feature requests/to-dos/bug reports
  * Do __not__ ever commit/push/merge/rebase into `master` branch
  * Avoid committing/pushing into `develop` branch
  * Create branches from `develop` and merge requests into `develop`
  * Only squash merge your branches
* Document your changes in [CHANGELOG.md](CHANGELOG.md)
* When merging, use a proper commit title and description

### Committing
TBD

### Merging
Do __not__ ever `git merge`! Use `git rebase`.

### Pulling
As merging is not allowed, use `git pull --rebase` or `git pull -r` as well!

### Pushing
_Reminder:_ Rebasing instead of merging requires pushes to be forced in most cases.

## Directory structure
* `bin/`: Contains executable binaries for this project, e.g. tasks, tests, etc.
  * `...`
* `dist/`: The generated artifact that will be consumed by [dotfiles][github-dotfiles-url]
  * `...`
* `lib/`: Libraries required and used by the executables in `bin/`
  * `test/`: Mirrors the `src/` directory structure but contains specs to test all the files
  * `...`
* `src/`: Contains the source files to be edited
  * `lib/`: Libraries required and used by `profile.sh` and/or executables in `libexec/`
    * `cli.sh`: Provides the `bonprix` function as a CLI
  * `libexec/`: Executable binaries that are internally used by `lib/cli.sh`
  * `aliases`: Defines aliases provided by `profile.sh`
  * `Brewfile`: Defines Homebrew dependencies, see [here][github-homebrew-bundle-url] for more information
  * `env`: Defines global environment variables provided by `profile.sh`
  * `profile.sh`: The entry point to this dotfiles package that will be sourced to provide all the stuff
* `...`

Copyright © 2018 ([MIT](LICENSE.md)) [Christian Grete](https://christiangrete.com)

[github-dotfiles-url]: https://github.com/ChristianGrete/dotfiles
[github-flow-guide-url]: https://guides.github.com/introduction/flow
[github-fork-doc-url]: https://help.github.com/articles/fork-a-repo
[github-homebrew-bundle-url]: https://github.com/Homebrew/homebrew-bundle
[github-url]: https://github.com/ChristianGrete/dotfiles-bonprix