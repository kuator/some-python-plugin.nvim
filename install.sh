#!/usr/bin/env bash
set -euox pipefail

export pylance_home=$(find ~/.vscode/extensions -iname "*pylance*" -type d | sort | tail -1)

cd $pylance_home/dist

vi -E -s server.bundle.js << EOF
:%s/\vif(\(!process\['env'\].{-}\))(return.{-})\ze;/return true
:update
:quit
EOF
