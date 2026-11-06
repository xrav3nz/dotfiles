#!/usr/bin/env bash
set -euo pipefail

DOT_PATH="$(
  cd "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"

#
# System packages (things mise shouldn't own)
#
if command -v apt-get >/dev/null; then
  sudo apt-get update
  sudo apt-get install -y \
    zsh tmux git curl unzip build-essential \
    autoconf libssl-dev libyaml-dev libreadline-dev zlib1g-dev libffi-dev libgmp-dev \
    universal-ctags xclip
fi

if [[ "$(basename "${SHELL:-}")" != "zsh" ]] && command -v zsh >/dev/null; then
  chsh -s "$(command -v zsh)"
fi

#
# Dotfile links
#
ln -sfn "${DOT_PATH}/zsh/zshrc" ~/.zshrc

ln -sfn "${DOT_PATH}/tmux/tmux.conf" ~/.tmux.conf
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf ~/.vim
ln -sfn "${DOT_PATH}/vim" ~/.vim

mkdir -p ~/.config

rm -rf ~/.config/git
ln -sfn "${DOT_PATH}/git" ~/.config/git

rm -rf ~/.config/nvim
ln -sfn "${DOT_PATH}/nvim" ~/.config/nvim

rm -rf ~/.config/kitty
ln -sfn "${DOT_PATH}/kitty" ~/.config/kitty

# Link only the file so ~/.config/mise/conf.d can hold machine-local config.
mkdir -p ~/.config/mise
ln -sfn "${DOT_PATH}/mise/config.toml" ~/.config/mise/config.toml

if [[ "$OSTYPE" == darwin* ]]; then
  rm -rf ~/.config/aerospace
  ln -sfn "${DOT_PATH}/aerospace" ~/.config/aerospace

  rm -rf ~/.config/borders
  ln -sfn "${DOT_PATH}/borders" ~/.config/borders
fi

#
# Tools
#
export PATH="$HOME/.local/bin:$PATH"
if ! command -v mise >/dev/null; then
  curl https://mise.run | sh
fi
mise install

~/.tmux/plugins/tpm/bin/install_plugins || echo "tpm: run prefix + I inside tmux to install plugins"

if [ ! -f "${DOT_PATH}/git/config.local" ]; then
  echo "NOTE: create ${DOT_PATH}/git/config.local for machine-specific git config"
fi
