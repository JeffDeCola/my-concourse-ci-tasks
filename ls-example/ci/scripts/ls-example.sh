#!/bin/bash
# ls-example ls-example.sh

set -e -x

echo "List whats in the current directory"
ls -lat

cd my-concourse-ci-tasks

touch boo.txt

ls -lat
