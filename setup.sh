#!/usr/bin/env bash

DOT_PATH="$(
  cd "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"

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

rm -rf ~/.config/aerospace
ln -sfn "${DOT_PATH}/aerospace" ~/.config/aerospace

rm -rf ~/.config/borders
ln -sfn "${DOT_PATH}/borders" ~/.config/borders
