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

#### Ghostty

```bash
brew install --cask ghostty
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
brew install nvm
```

#### pnpm

Node Package Manager

```sh
brew install pnpm
```

#### ni

[`ni`](https://github.com/antfu-collective/ni)

```sh
brew install ni
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

Use tokyonight theme

```sh
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
bat cache --build
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

#### tokei

Line counter

```sh
brew install tokei
```

#### lazygit.nvim

Install lazygit

```bash
brew install lazygit
```

When in neovim, open the lazygit config with `:LazyGitConfig` and add:

```yaml
os:
  editPreset: "nvim-remote"
  open: 'nvim --server "$NVIM" --remote-send "<cmd>lua
    require(''core.scripts.lazygit-open-file'')(''{{filename}}'', ''1'')<CR>"'
```

#### git-delta

```sh
brew install git-delta
```

### Raycast

[download](https://www.raycast.com/)

## Resources

[Josean](https://github.com/josean-dev/dev-environment-files?tab=readme-ov-file)
