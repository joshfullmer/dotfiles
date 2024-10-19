# Dotfiles

## System Setup

### Set capslock key to ctrl

-  > System Settings > Keyboard > Keyboard Shortcuts... > Modifier Keys > Capslock key to Control^
- Change keyboard sensitivity for repeat rate and delay

### Install homebrew

[https://brew.sh/](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone dotfiles repo and symlink

Install `stow`, a symlink farm manager to symlink this directory to root.

```sh
brew install stow
```

Clone existing dotfiles into `~/.dotfiles` directory.

```sh
git clone git@github.com:joshfullmer/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Use `stow` to create symlinks.

```sh
stow .
```

### Terminal Setup

#### WezTerm

```bash
brew install --cask wezterm
```

#### Monaspace

```sh
brew tap homebrew/cask-fonts
brew install font-monaspace-nerd-font
```

#### ripgrep

```sh
brew install ripgrep
```

### Dependency Installation

#### Neovim

```sh
brew install neovim
```

#### tmux

Terminal multiplexer

```sh
brew install tmux
```

Add tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Powerlevel 10k

Terminal theme

```sh
brew install powerlevel10k
```

#### nvm

Node Version Manager

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

#### pnpm

Node Package Manager

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

#### fzf

Fuzzy Finder

```sh
brew install fzf
```

#### fd

Fuzzy Find wrapper/improvements

```sh
brew install fd
```

#### bat

Better `cat`

```sh
brew install bat
```

#### eza

Better `ls`

```sh
brew install eza
```

#### tldr

Better help pages

```sh
brew install tlrc
```

#### zoxide

Better `cd`

```sh
brew install zoxide
```

### lazygit.nvim

Install lazygit

```bash
brew install lazygit
```

When in neovim, open the lazygit config with `:LazyGitConfig` and add:

```yaml
os:
  edit: nvim --server /tmp/nvim-server-$(tmux display-message -p '\#{session_id}-#{window_id}-#{pane_id}').pipe --remote-send "<cmd>lua require('core.scripts.lazygit-open-file')('{{filename}}', '{{line}}')<CR>"
  editAtLine: nvim --server /tmp/nvim-server-$(tmux display-message -p '\#{session_id}-#{window_id}-#{pane_id}').pipe --remote-send "<cmd>lua require('core.scripts.lazygit-open-file')('{{filename}}', '{{line}}')<CR>"
  open: nvim --server /tmp/nvim-server-$(tmux display-message -p '\#{session_id}-#{window_id}-#{pane_id}').pipe --remote-send "<cmd>lua require('core.scripts.lazygit-open-file')('{{filename}}', '{{line}}')<CR>"
```

## Resources

[Josean](https://github.com/josean-dev/dev-environment-files?tab=readme-ov-file)
