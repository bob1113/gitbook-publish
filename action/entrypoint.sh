#!/bin/sh

echo "GITHUB_REPOSITORY=[$GITHUB_REPOSITORY]"
echo "GITHUB_SHA=[$GITHUB_SHA]"
echo "USER_NAME=[$USER_NAME]"
echo "USER_EMAIL=[$USER_EMAIL]"
echo "$GH_PAGES_FOLDER"

 
# git init
git config --global --add safe.directory /github/workspace
# git config --local user.name $USER_NAME
# git config --local user.email $USER_EMAIL
git config --local user.name bob1113
git config --local user.email bobolai1113@gmail.com
# git config user.name
# git config user.email
# git clone https://github.com/${USER_NAME}/${GITHUB_REPOSITORY}.git
# echo "git clone https://github.com/${USER_NAME}/${GITHUB_REPOSITORY}.git"

# cd ${GITHUB_REPOSITORY}
# gitbook build ./book --output=./_book

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