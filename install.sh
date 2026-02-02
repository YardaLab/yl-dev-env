#!/usr/bin/env bash
set -e

# =============================================================
# YardaLab Shared Developer Environment installer
# Neovim installation strategy (YDE-19):
# - Official Neovim release tarball
# - User-local installation (no sudo required)
# - Idempotent and non-interactive
# - Works in GitHub Codespaces and local Dev Containers
# =============================================================

echo "[yl-dev-env] Installing developer environment..."

# -------------------------------
# Neovim binary installation
# -------------------------------
if ! command -v nvim >/dev/null 2>&1; then
  echo "[yl-dev-env] Neovim not found, installing..."

  NVIM_VERSION="v0.10.4"
  NVIM_ARCHIVE="nvim-linux-x86_64.tar.gz"
  NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/${NVIM_ARCHIVE}"

  PREFIX="$HOME/.local"
  BIN_DIR="$PREFIX/bin"

  tmp_dir="$(mktemp -d)"

  curl -fsSL "$NVIM_URL" -o "$tmp_dir/$NVIM_ARCHIVE"
  tar -xzf "$tmp_dir/$NVIM_ARCHIVE" -C "$tmp_dir"

  mkdir -p "$PREFIX"
  cp -r "$tmp_dir/nvim-linux-x86_64" "$PREFIX/nvim"

  mkdir -p "$BIN_DIR"
  ln -sf "$PREFIX/nvim/bin/nvim" "$BIN_DIR/nvim"

  rm -rf "$tmp_dir"

  echo "[yl-dev-env] Neovim installed: $("$BIN_DIR/nvim" --version | head -n1)"
else
  echo "[yl-dev-env] Neovim already installed"
fi

# Ensure user-local bin is on PATH for current session
export PATH="$HOME/.local/bin:$PATH"

# -------------------------------
# Neovim configuration
# -------------------------------
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -d "$SCRIPT_DIR/nvim" ]; then
  echo "[yl-dev-env] Installing Neovim config..."
  mkdir -p "$HOME/.config/nvim"
  cp -r "$SCRIPT_DIR/nvim"/* "$HOME/.config/nvim/"
fi

echo "[yl-dev-env] Done."
