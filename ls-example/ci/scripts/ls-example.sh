#!/bin/sh
# ls-example ls-example.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "ls-example.sh -debug (START)"
    # set -e causes the shell to exit if any subcommand or pipeline returns a non-zero status. Needed for concourse.
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -e -x
    echo " "
else
    echo "ls-example.sh (START)"
    # set -e causes the shell to exit if any subcommand or pipeline returns a non-zero status.  Needed for concourse.
    set -e
    echo " "
fi

echo "The goal is to ls -Rls my-concourse-ci-tasks"
echo " "

echo "At start, you should be in a /tmp/build/xxxxx directory with two folders:"
echo "   /my-concourse-ci-tasks"
echo " "

echo "pwd is: $PWD"
echo " "

echo "List whats in the current directory"
ls -Rla
echo " "

echo "ls-example.sh (END)"
echo " "
