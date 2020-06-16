#!/usr/bin/env bash

# Apache License Version 2.0

set -e +o pipefail

add(){
  if [ -n "$1" ];
  then
    echo -n "-e $1 "
  fi
}

add "COVERALLS_SERVICE_NAME"
add "COVERALLS_REPO_TOKEN"
add "COVERALLS_PARALLEL"
add "COVERALLS_HOST"
add "COVERALLS_SKIP_SSL_VERIFY"
add "COVERALLS_FLAG_NAME"

if [ "$CI" = "true" ] && [ "$TRAVIS" = "true" ] && [ "$SHIPPABLE" != "true" ];
then
  add "CI"
  add "TRAVIS"
  add "SHIPPABLE"
  add "TRAVIS_BRANCH"
  add "TRAVIS_COMMIT"
  add "TRAVIS_JOB_NUMBER"
  add "TRAVIS_PULL_REQUEST"
  add "TRAVIS_JOB_ID"
  add "TRAVIS_REPO_SLUG"
  add "TRAVIS_TAG"
  add "TRAVIS_OS_NAME"
fi
