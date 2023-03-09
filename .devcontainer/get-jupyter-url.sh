#!/bin/bash

TOKEN=$(jupyter server list 2>&1 | grep -o 'token=[[:alnum:]]*' | sed 's/token=//')

URL=${CODESPACE_NAME}${CODESPACE_NAME:+-}${CODESPACE_NAME:+$JUPYTERPORT}${CODESPACE_NAME:+.preview.app.github.dev}
URL="http://${URL:-localhost}${URL:-:}${URL:-$JUPYTERPORT}/?token=${TOKEN}"

# echo "${URL}"
echo "Jupyter server token: ${TOKEN}"
