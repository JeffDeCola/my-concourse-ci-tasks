#!/bin/bash
# ls-example ls-example2.sh

set -e -x

echo "List whats in the current directory"
ls -lat

cd my-concourse-ci-tasks

echo "hi jeff" > boo2.txt

ls -lat

cd ..

cd result2

echo "hi jeff" > blah2.txt

ls -lat
