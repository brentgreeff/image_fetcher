alias doc="docker"
alias pose="docker-compose"

source docker-app.sh

up() {
  set -x
  pose up --force-recreate "$@"
  set +x
}

down() {
  set -x
  pose down "$@"
  set +x
}

build() {
  set -x
  pose build "$@"
  set +x
}

logs() {
  set -x
  pose logs -f "$@"
  set +x
}

vol() {
  set -x
  doc volume inspect $1
  set +x
}
