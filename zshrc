if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "robbyrussell/oh-my-zsh", use:"lib/{compfix,completion}.zsh"
zplug "plugins/git",              from:oh-my-zsh
zplug "plugins/tig",              from:oh-my-zsh
zplug "plugins/fasd",             from:oh-my-zsh
zplug "plugins/last-working-dir", from:oh-my-zsh
zplug "plugins/dirhistory",       from:oh-my-zsh
zplug "plugins/dircycle",         from:oh-my-zsh
zplug "plugins/debian",           from:oh-my-zsh, hook-load:'unalias ag'
zplug "plugins/screen",           from:oh-my-zsh
zplug "plugins/vundle",           from:oh-my-zsh
zplug "plugins/rbenv",            from:oh-my-zsh
zplug "plugins/bundler",          from:oh-my-zsh
zplug "plugins/rails",            from:oh-my-zsh
zplug "plugins/rake-fast",        from:oh-my-zsh
zplug "plugins/docker",           from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "olivierverdier/zsh-git-prompt", use:zshrc.sh
zplug "djui/alias-tips"
zplug "nar8789/selected-oh-my-zsh-libs"
zplug "nar8789/shell-configs"
zplug "zsh-users/zsh-autosuggestions",     defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
  zplug install
fi
zplug load
