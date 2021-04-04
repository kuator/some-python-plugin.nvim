#!/usr/bin/env bash
set -euox pipefail

export pylance_home=$(find ~/.vscode/extensions -iname "*pylance*" -type d | sort | tail -1)

cd $pylance_home/dist

vi -E -s server.bundle.js << EOF
:%s/\vprocess\['env'\].{-}return\zs(!)(.{-})\ze;/ \2
:update
:quit
EOF
