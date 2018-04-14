if [ ! -d ~/.zgen-master ]; then
  git clone https://github.com/tarjoilija/zgen.git ~/.zgen-master
fi

plugins=(rails)  # for some reason this throws errors if I try to load it as `zgen oh-my-zsh plugin/rails`
source ~/.zgen-master/zgen.zsh
if ! zgen saved; then
  echo 'Creating a zgen save'

  zgen load nar8789/oh-my-zsh-preamble
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/debian
  zgen oh-my-zsh plugins/dircycle
  zgen oh-my-zsh plugins/dirhistory
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/fasd
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/kubectl
  # zgen oh-my-zsh plugins/last-working-dir
  zgen oh-my-zsh plugins/rails
  zgen oh-my-zsh plugins/rake-fast
  zgen oh-my-zsh plugins/rbenv
  zgen oh-my-zsh plugins/screen
  zgen oh-my-zsh plugins/shrink-path
  zgen oh-my-zsh plugins/tig
  zgen oh-my-zsh plugins/vundle
  zgen oh-my-zsh plugins/yarn

  zgen oh-my-zsh plugins/asdf # after other version managers, so its paths take precedence

  if [ -r ~/.zgen_local_loads ]; then
    . ~/.zgen_local_loads
  fi

  zgen load djui/alias-tips
  zgen load juliangruber/yarn-aliases
  zgen load nar8789/backlight-hack
  zgen load nar8789/kubectl-aliases
  zgen load nar8789/personal-shell-configs
  zgen load nar8789/screenswap-hack
  zgen load nar8789/shell-secrets
  zgen load nar8789/systemd-aliases
  zgen load olivierverdier/zsh-git-prompt
  zgen load zsh-users/zsh-completions

  # must be loaded last!
  # zgen load zsh-users/zsh-autosuggestions
  # zgen load zsh-users/zsh-syntax-highlighting
  # unfortunately these currently interfere with yank-pop

  zgen save
fi

. ~/.asdf/completions/asdf.bash
