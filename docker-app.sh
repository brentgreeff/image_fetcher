app() {
  set -x
  pose exec app "$@"
  set +x
}

b() {
  set -x
  pose exec app bundle "$@"
  set +x
}

rb() {
  set -x
  pose run --rm app bundle "$@"
  set +x
}

c() {
  set -x
  pose exec app pry
  set +x
}

dash() {
  set -x
  pose exec app bash
  set +x
}

run() {
  set -x
  pose run --rm app "$@"
  set +x
}

dspec() {
  set -x
  pose exec app bin/rspec $1
  set +x
}

guard() {
  set -x
  pose exec app bin/guard
  set +x
}
