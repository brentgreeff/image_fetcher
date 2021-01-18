# Image Fetcher

## Local dev setup

`source docker.sh` to make docker & compose easier to work with.

`up` - to start the dev env.

## Run tests

`docker-compose exec api bin/guard` or the alias `guard`

Saving a file will run corresponding test.

Press [Enter] - to run all tests.

## Rubocop

Please run `rubocop` before pushing.

## Flog

Looking for a refactor? `flog -g lib/`

https://ruby.sadi.st/Flog.html

## Simplecov

`open coverage/index.html` to see current code coverage.
Running specs normally or under guard will show coverage.
