# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test govulncheck https://github.com/wizzardich/asdf-govulncheck.git "govulncheck --help"
```

Tests are automatically run in GitHub Actions on push and PR.
