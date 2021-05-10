if [ ! -d ~/.zgen-master ]; then
  git clone https://github.com/tarjoilija/zgen.git ~/.zgen-master
fi

source ~/.zgen-master/zgen.zsh
if ! zgen saved; then
  echo 'Creating a zgen save'

  zgen load nar8789/personal-zgen-base

  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/debian
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/kubectl
  zgen oh-my-zsh plugins/rails
  zgen oh-my-zsh plugins/rake-fast
  zgen oh-my-zsh plugins/rbenv
  zgen oh-my-zsh plugins/screen
  zgen oh-my-zsh plugins/tig
  zgen oh-my-zsh plugins/vundle
  zgen oh-my-zsh plugins/yarn

  zgen oh-my-zsh plugins/asdf # after other version managers, so its paths take precedence

  if [ -r ~/.zgen_local_loads ]; then
    . ~/.zgen_local_loads
  fi

  zgen load juliangruber/yarn-aliases
  zgen load nar8789/backlight-hack
  zgen load nar8789/kubectl-aliases
  zgen load nar8789/screenswap-hack
  zgen load nar8789/shell-secrets
  zgen load nar8789/systemd-aliases

  zgen save
fi

. ~/.asdf/completions/asdf.bash

if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

alias update-all='sudo -n echo sudo already authenticated; adg; asdf update; asdf plugin-update --all'
alias xe='autorandr -c external'
alias xd='autorandr -c dual-single'
