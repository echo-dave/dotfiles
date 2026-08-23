# Dotfiles

## What's included

- ghostty terminal
- zsh
- powerlevel10 for zsh
- tmux 3.6 with catppuccin 2.3.0, tmux-sensible,
- brewfile for deps and tools

## Clone with submodules

```bash
git clone --recurse-submodules git@github.com:echo-dave/dotfiles.git
```

## Install deps

```bash
brew bundle --file=$HOME/dotfiles/Brewfile
gh auth login
gh ext install meiji163/gh-notify

```

[gh notify docs](https://github.com/meiji163/gh-notify)

## Stow configs

```bash
stow --adopt .
git reset --hard
```

## Nvim

1. run Lazy - installs packages
2. run Mason - install needed LSPs but check lsp folder for configs
3. run Checkhealth - make sure everything is working
4. add any additional parsers as needed

> [!NOTE]
> Tmux 3.7 needs a command input fix, but we've worked around it in the mean time as per [this issue](https://github.com/catppuccin/tmux/issues/600?utm_source=chatgpt.com)

> [!TIP]
> Here's the [Catppuccin Color Palette](https://catppuccin.com/palette/)

## SSH commit signing

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"

mkdir -p ~/.config/git
echo "$(git config user.email) $(cat ~/.ssh/id_ed25519.pub)" >> ~/.config/git/allowed_signers
git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers

mkdir -p ~/.config/git
echo "$(git config user.email) $(cat ~/.ssh/id_ed25519.pub)" >> ~/.config/git/allowed_signers
git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers
```
