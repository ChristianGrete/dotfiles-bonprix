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
  * Create branches from `develop` and merge requests to `develop`
  * Only squash merge your branches
* Document your changes in [CHANGELOG.md](CHANGELOG.md)
* When merging, use a proper commit title and description

### Committing
TBD

### Merging
Do __not__ ever `git merge`. Use `git rebase`.

### Pulling
As merging is not allowed, use `git pull --rebase` or `git pull -r` as well.

### Pushing
_Reminder:_ Rebasing instead of merging requires pushes to be forced in most cases.

Copyright © 2018 ([MIT](LICENSE.md)) [Christian Grete](https://christiangrete.com)

[github-dotfiles-url]: https://github.com/ChristianGrete/dotfiles
[github-flow-guide-url]: https://guides.github.com/introduction/flow
[github-fork-doc-url]: https://help.github.com/articles/fork-a-repo
[github-url]: https://github.com/ChristianGrete/dotfiles-bonprix