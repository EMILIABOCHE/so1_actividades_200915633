#!/bin/bash

GITHUB_USER="$1"


if [ -z "$GITHUB_USER" ]; then
  echo "Error: La variable GITHUB_USER no está definida."
  exit 1
fi

RESPONSE=$(curl -s "https://api.github.com/users/$GITHUB_USER")

USER_ID=$(echo $RESPONSE | jq -r '.id')
CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')

MESSAGE="Usuario $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
echo "$MESSAGE"

FECHA=$(date +'%Y-%m-%d')
LOG_DIR="/tmp/$FECHA"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/log.log"


echo "$MESSAGE" >> "$LOG_FILE"
