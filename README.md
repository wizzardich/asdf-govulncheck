<div align="center">

# asdf-govulncheck [![Build](https://github.com/wizzardich/asdf-govulncheck/actions/workflows/build.yml/badge.svg)](https://github.com/wizzardich/asdf-govulncheck/actions/workflows/build.yml) [![Lint](https://github.com/wizzardich/asdf-govulncheck/actions/workflows/lint.yml/badge.svg)](https://github.com/wizzardich/asdf-govulncheck/actions/workflows/lint.yml)


[govulncheck](https://github.com/golang/vuln) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add govulncheck
# or
asdf plugin add govulncheck https://github.com/wizzardich/asdf-govulncheck.git
```

govulncheck:

```shell
# Show all installable versions
asdf list-all govulncheck

# Install specific version
asdf install govulncheck latest

# Set a version globally (on your ~/.tool-versions file)
asdf global govulncheck latest

# Now govulncheck commands are available
govulncheck --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/wizzardich/asdf-govulncheck/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vlad Tomashpolskyi](https://github.com/wizzardich/)
