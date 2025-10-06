#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
runs_dir="$script_dir"/runs

bash ./"$runs_dir"/preferences.sh

git clone https://github.com/Discr3te/.dotfiles.git ~
bash ./"$runs_dir"/link.sh

bash ./"$runs_dir"/ssh.sh
