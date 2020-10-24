#!/usr/bin/env bash
set -euo pipefail

rm -rf pkg || true

version=$(curl -s 'https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance' | grep '<script class="jiContent" defer="defer" type="application/json">' |  sed 's/<[^>]*>//g' | jq -r .Resources.Version)

mkdir pkg || true
cd pkg

curl -c cookie-jar.txt "https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance"

curl -s "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/vscode-pylance/$version/vspackage" \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'DNT: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' \
  -H 'Referer: https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance' \
  -j -b cookie-jar.txt --compressed --output ms-python.vscode-pylance-$version

unzip ms-python.vscode-pylance-$version

ln -s --relative extension/dist/server.bundle.js pylance.js

cd ..
echo "#!/usr/bin/env bash" > pylance
echo "node $(pwd)/pkg/pylance.js --stdio" >> pylance

sudo install pylance /usr/local/bin/
