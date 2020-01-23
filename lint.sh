#!/bin/bash
set -eu

DEFAULT_BRANCH='master'
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# When current branch is not master
# fetch master to properly get all changed files in a push
if [[ $BRANCH_NAME != $DEFAULT_BRANCH ]] ; then
    git fetch origin master:master --depth=1
fi

# when current branch is master
REF='HEAD~1'

# When current branch is not master
# take all changed files into account compared to master
if [[ $BRANCH_NAME != $DEFAULT_BRANCH ]] ; then
    REF="$DEFAULT_BRANCH.."
fi


CHANGE_FILES=$(git diff $REF --name-only);

echo $CHANGE_FILES;
