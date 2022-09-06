#!/bin/sh

echo "GITHUB_SHA=[$GITHUB_SHA]"
echo "USER_NAME=[$USER_NAME]"
echo "USER_EMAIL=[$USER_EMAIL]"

git config --global --add safe.directory /github/workspace
git config --local user.name $USER_NAME
git config --local user.email $USER_EMAIL

ls -l -a
git add docs
git commit
git checkout -b gh-pages

ls -l -a
git checkout master -- docs
git add docs
rm -rf !\(docs\)
git commit -m "Add gitbook static files (from $GITHUB_SHA)"

git checkout master
git rm -rf docs

git push origin gh-pages -f
echo "Done!!"