#!/usr/bin/env bash
set -e

echo "[yl-dev-env] Installing developer environment..."

if [ -d "nvim" ]; then
  echo "[yl-dev-env] Installing Neovim config..."
  mkdir -p "$HOME/.config/nvim"
  cp -r nvim/* "$HOME/.config/nvim/"
fi

echo "[yl-dev-env] Done."
