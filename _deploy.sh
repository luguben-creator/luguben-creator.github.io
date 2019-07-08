#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "benjamin.lugu@aims.ac.rw"
git config --global user.name "Test work"

git clone -b gh-pages https://$29885bc7c8ad59264f3c9fcfc87b7fec318558ac@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
