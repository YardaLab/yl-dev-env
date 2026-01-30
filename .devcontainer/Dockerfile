FROM mcr.microsoft.com/devcontainers/base:debian

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    neovim \
    git-lfs \
 && rm -rf /var/lib/apt/lists/*
