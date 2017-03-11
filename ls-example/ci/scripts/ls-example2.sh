#!/bin/bash
# ls-example ls-example2.sh

set -e -x

echo "List whats in the current directory"
ls -lat

cd my-concourse-ci-tasks

touch boo2.txt

ls -lat
