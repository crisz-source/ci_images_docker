#!/bin/bash

# Nome do arquivo de versão
VERSION_FILE="version.txt"

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

# Salvar no arquivo de log
echo "Versão das imagens alterada de $CURRENT_VERSION para $NEW_VERSION" > logs_image.txt
echo "Logs das imagens geradas com sucesso!" >> logs_image.txt