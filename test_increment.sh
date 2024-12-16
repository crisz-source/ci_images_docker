#!/bin/bash

# Nome do arquivo de versão
VERSION_FILE="version.txt"
LOG_FILE="logs_image.txt"

# Checar se o arquivo de versão existe
if [[ ! -f "$VERSION_FILE" ]]; then
  echo "1.0" > "$VERSION_FILE"
fi

# Ler a versão atual do arquivo
CURRENT_VERSION=$(cat "$VERSION_FILE")

# Incrementar a versão (somente o número "MINOR")
IFS='.' read -r MAJOR MINOR <<< "$CURRENT_VERSION"
NEW_VERSION="$MAJOR.$((MINOR + 1))"

# Salvar a nova versão no arquivo
echo "$NEW_VERSION" > "$VERSION_FILE"

# Exibir as versões (apenas para debug, opcional)
echo "Versão anterior: $CURRENT_VERSION"
echo "Nova versão: $NEW_VERSION"

# Salvar um log 
echo "Versão das imagens alterada de $CURRENT_VERSION para $NEW_VERSION" > $LOG_FILE

# Agora, vamos garantir que os arquivos alterados sejam commitados e enviados ao GitHub
git add $VERSION_FILE $LOG_FILE
git commit -m "Atualiza as imagens e a versão para $NEW_VERSION"
git push origin main
