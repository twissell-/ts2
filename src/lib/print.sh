#!/bin/bash -eu
set -o pipefail

function print_info() {
    printf "${B_BLUE}[i]: %s${NC}\n" "${1%.}" 1>&2
}

function print_warning() {
    printf "${B_YELLOW}[!]: %s${NC}\n" "${1%.}" 1>&2
}

function print_success() {
    printf "${B_GREEN}[✔]: %s${NC}\n" "${1%.}" 1>&2
}

function print_error() {
    printf "${B_RED}[✖]: %s${NC}\n" "${1%.}" 1>&2
}
