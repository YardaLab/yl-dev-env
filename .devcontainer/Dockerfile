FROM mcr.microsoft.com/devcontainers/base:debian

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    neovim \
 && rm -rf /var/lib/apt/lists/*
