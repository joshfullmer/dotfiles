# Dotfiles

## System Setup

Set capslock key to ctrl

-  > System Settings > Keyboard > Keyboard Shortcuts... > Modifier Keys > Capslock key to Control^

## Installation

Based on [this article](https://www.atlassian.com/git/tutorials/dotfiles).

- Clone the repo into the "side" folder called `.dotfiles`

```sh
git clone --bare git@github.com:joshfullmer/dotfiles.git $HOME/.dotfiles
```

- Add temporary alias to initially manage dotfiles git

```sh
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
```

- Checkout the repo
  - You may need to delete existing files

```sh
dotfiles checkout
```

- Ignore untracked files

```sh
dotfiles config --local status.showUntrackedFiles no
```

- Either restart the shell or source the `.zshrc` file.

```sh
source ~/.zshrc
```

Once all these steps are taken, you can then modify dotfiles as follows:

```sh
dotfiles status
dotfiles add .zshrc
dotfiles commit -m ".zshrc change"
dotfiles push
```

### Terminal Setup

**iTerm2**

```sh
brew install --cask iterm2
```

**Monaspace**

```sh
brew tap homebrew/cask-fonts
brew install font-monaspace
```

**ripgrep**

```sh
brew install ripgrep
```

#### iTerm2 settings

**Colors**

- Download [tokyonight](https://github.com/enkia/tokyo-night-vscode-theme/blob/master/tokyo-night.itermcolors)
- Settings > Profiles > Colors > Color Presets > Import...

**Font**

- Settings > Profiles > Text > Font > ...
  - MonaspiceAr Nerd Font Propo
  - Regular 14

**Window**

- Settings > Profiles > Window > ...
  - Transparency > 35
  - Keep background colors opaque
  - Use transparency

**Terminal**

- Settings > Profiles > Terminal > ...
  - Enable mouse reporting
  - Report mouse wheel events
  - Report mouse clicks & drags

### Dependency Installation

**oh-my-zsh**

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Neovim**

```sh
brew install neovim
```

**tmux**
Terminal multiplexer

```sh
brew install tmux
```

**Powerlevel 10k**
Terminal theme

```sh
brew install powerlevel10k
```

**nvm**
Node Version Manager

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

**pnpm**
Node Package Manager

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

**fzf**
Fuzzy Finder

```sh
brew install fzf
```

**fd**
Fuzzy Find wrapper/improvements

```sh
brew install fd
```

**bat**
Better `cat`

```sh
brew install bat
```

**eza**
Better `ls`

```sh
brew install eza
```

**tldr**
Better help pages

```sh
brew install tlrc
```

**zoxide**
Better `cd`

```sh
brew install zoxide
```

### lazygit.nvim

When in neovim, open the lazygit config with `:LazyGitConfig` and add:

```yaml
os:
  edit: nvim --server /tmp/nvim-server-$(tmux display-message -p '\#{session_id}-#{window_id}-#{pane_id}').pipe --remote-send "<cmd>lua require('core.scripts.lazygit-open-file')('{{filename}}', '{{line}}')<CR>"
  editAtLine: nvim --server /tmp/nvim-server-$(tmux display-message -p '\#{session_id}-#{window_id}-#{pane_id}').pipe --remote-send "<cmd>lua require('core.scripts.lazygit-open-file')('{{filename}}', '{{line}}')<CR>"
  open: nvim --server /tmp/nvim-server-$(tmux display-message -p '\#{session_id}-#{window_id}-#{pane_id}').pipe --remote-send "<cmd>lua require('core.scripts.lazygit-open-file')('{{filename}}', '{{line}}')<CR>"
```

## Resources

[Josean](https://github.com/josean-dev/dev-environment-files?tab=readme-ov-file)
