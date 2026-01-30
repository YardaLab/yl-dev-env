# yl-dev-env

Shared developer environment for YardaLab projects.

This repository provides a minimal, reproducible terminal-first developer environment setup.

## Neovim

Install the Neovim configuration:

```bash
./install.sh
```

### Supported environments

* Terminal
* SSH
* GitHub Codespaces

### Scope

* No plugins
* Minimal sane defaults
* Terminal-only workflow

### Git LFS support

The reusable devcontainer base includes `git-lfs` to ensure compatibility
with repositories that use Git LFS.

- Git LFS is installed at image build time
- It is not initialized automatically
- Repositories without Git LFS are unaffected
- Repository-level Git hooks remain the source of truth