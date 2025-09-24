#!/bin/sh
echo -ne '\033c\033]0;LuckeRun\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/LuckeRun.x86_64" "$@"
