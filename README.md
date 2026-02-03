# yl-dev-env

Shared developer environment for YardaLab projects.

This repository provides a minimal, reproducible, terminal-first developer environment setup.

---

## Neovim

Neovim **is not installed in the devcontainer Dockerfile**.

Installation is handled via a shared, user-local, idempotent installer script:

```bash
./install.sh
```

### Why this approach

* works consistently in:

  * GitHub Codespaces
  * local Dev Containers (Docker Desktop, VMware, WSL)
* does **not** require `sudo`
* `$HOME` is the source of truth (`~/.local`)
* safe to run repeatedly (idempotent)
* avoids coupling editor tooling to the container image

### What `install.sh` does

* downloads the official Neovim release tarball
* installs the Neovim binary into `~/.local/bin`
* installs Neovim configuration into `~/.config/nvim`
* skips installation if Neovim is already present

---

## Supported environments

* Terminal
* SSH
* GitHub Codespaces
* Local Dev Containers

---

## Line endings & cross-platform compatibility

This repository includes a `.gitattributes` file to **enforce LF (Unix) line endings** for scripts and configuration files:

```gitattributes
*.sh  text eol=lf
*.lua text eol=lf
*.md  text eol=lf
```

### Why this matters

On Windows hosts (Docker Desktop, WSL, VMware), Git may otherwise use CRLF line endings.
This can break shell scripts inside Linux containers with errors like:

```text
env: ‘bash\r’: No such file or directory
```

Using `.gitattributes` ensures that:

* shell scripts remain executable in Linux containers
* behavior is consistent between Codespaces and local environments
* line-ending related bugs are eliminated at the repository level

---

## Scope

* No plugins
* Minimal sane defaults
* Terminal-only workflow

---

## Git LFS support

The reusable devcontainer base includes `git-lfs` to ensure compatibility with repositories that use Git LFS.

* Git LFS is installed at image build time
* It is not initialized automatically
* Repositories without Git LFS are unaffected
* Repository-level Git hooks remain the source of truth

---

## Base environment

* Base OS: Debian (via `devcontainers/base`)
* Default user: non-root (`vscode`)
* UID/GID: `1000:1000` (Codespaces-compatible)
* Passwordless sudo enabled
* Works in GitHub Codespaces and local Docker
