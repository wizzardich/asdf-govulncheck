#!/usr/bin/env bash

set -euo pipefail

GO_PROJECT="golang.org/x/vuln"
GO_MODULE="golang.org/x/vuln/cmd/govulncheck"
TOOL_NAME="govulncheck"
TOOL_TEST="govulncheck --help"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_go_module_versions() {
  VERSIONS=$(go list -m -versions "$GO_PROJECT" | tr ' ' '\n' | sed 's/^v//' | grep -v "$GO_PROJECT" || true)

  if [ -z "$VERSIONS" ]; then
    VERSIONS="0.0.0"
  fi

  echo $VERSIONS
}

list_all_versions() {
  list_go_module_versions
}

install_version() {
  local install_type="$1"
  local version="v$2"
  local install_path="${3%/bin}/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  if [ "$version" == "v0.0.0" ]; then
    version="latest"
  fi

  (
    GOBIN="${install_path}" go install "${GO_MODULE}@${version}"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
