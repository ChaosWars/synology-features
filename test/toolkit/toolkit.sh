#!/bin/bash

set -eu

source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

check "execute command" bash -c "python /toolkit/pkgscripts-ng/PkgCreate.py -h"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
