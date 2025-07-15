#!/bin/bash
brew list --cask | xargs -I {} bash -c '
  CASK_NAME="{}";
  # Récupère le chemin exact de l''application .app via la sortie JSON de brew info
  APP_PATH=$(brew info --cask --json=v2 "$CASK_NAME" 2>/dev/null | \
             jq -r ".casks[0].artifacts[] | select(.app) | .app[] | select(type == \"string\")" | \
             head -1);

  # Conditions : 1. Le chemin de l''application existe. 2. L''application n''est PAS déjà lancée.
  test -n "$APP_PATH" && \
  test ! -z "$APP_PATH" && \
  ! pgrep -f "$(basename "$APP_PATH" .app)" >/dev/null && \
  open "$APP_PATH"; echo "Continue..."; read;
'