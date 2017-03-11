#!/bin/bash
# ls-example ls-example.sh

set -e -x

echo "List whats in the current directory"
ls -lat

cd my-concourse-ci-tasks

echo "hi jeff" > boo.txt

ls -lat

cd ..

cd result

echo "hi jeff" > blah.txt

ls -lat
