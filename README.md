# Image Fetcher

## Local dev setup

### Open a shell:

`cd` into this downloaded repo.

`source docker.sh` to make docker & compose easier to work with.

`up` - to start the dev env.

With `up` still running, open a second shell.

In the second shell `source docker.sh`

and then: `download -f example_files/urls.txt`

Files downloaded will be printed in the first shell running `up`.

## Run tests

`source docker.sh`

Run `guard`

Press [ Enter ] - to run all tests.

Saving a file will run the corresponding test.

## Rubocop

Please run `rubocop` before pushing.

## Flog

Looking for a refactor? `flog -g lib/`

https://ruby.sadi.st/Flog.html

## Simplecov

`open coverage/index.html` to see current code coverage.
Running specs normally or under guard will show coverage.
