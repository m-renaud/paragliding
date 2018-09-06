#!/bin/bash

# Abort if any of the commands fail.
set -o errexit

DEPLOY_DIRECTORY=dist
DEPLOY_BRANCH=gh-pages

previous_branch=`git rev-parse --abbrev-ref HEAD`
commit_hash=`git log -n 1 --format="%H" HEAD`

# Switch to deployment branch.
git checkout ${DEPLOY_BRANCH}

# Copy generated files to root directory.
rsync -av ${DEPLOY_DIRECTORY}/* .

# Add and commit changes.
git add --all
git commit -m "Deploying from ${commit_hash}"
git push

# Switch back to previous branch.
git checkout ${previous_branch}
