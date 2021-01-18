# this is meant to be sourced

source "$HOME/local/config/nar8789/path.sh"

#export TZ='America/Phoenix'
#export TZ='Asia/Shanghai'

unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export GLFW_IM_MODULE=ibus # for ibus support in kitty. see https://github.com/kovidgoyal/kitty/issues/469

systemctl_import_rcsh() {
  systemctl --user import-environment PATH TZ
  # no need to import SSH_AUTH_SOCK, as systemctl already has it
}


# cruft!

  # exports from above
  #systemctl --user import-environment SSH_AUTH_SOCK
  # in a very roundabout way, this is exported by
  # `/etc/X11/Xsession.d/90x11-common_ssh-agent`
  # this actually wraps the .xsession invocation rather than directly updating
  # environment.  Moreover, it is not the only script wrapping xsession...
  # actual invocation looks like
  #
  # ```
  # /usr/bin/ssh-agent /usr/bin/im-launch /usr/bin/zsh /home/xiao/.xsession,
  # ```
  #
  # Which is a little horrifying...
  # - Xsession has a hook for wrapping startup in the form of a `STARTUP`
  #   env var available to scripts in `/etc/X11/Xsession.d`
  # - ssh-agent wraps startup and exports SSH_AUTH_SOCK and SSH_AGENT_PID.
  #   - this isn't the best way to start up ssh-agent, since it means it's 
  #     only available to graphical sessions
  #   - Sidenote: Since I'm `exec`ing at the end of xsession, an odd thing
  #     happens where this actually becomes my child rather than my parent.
  # - im-launch starts fcitx. If I disable `use-ssh-agent` in
  #   `/etc/X11/Xsession.options`, I also get an `fcitx <defunct>` as child.
  #   Actual fcitx runs forked and unparented.
  # - `/usr/bin/zsh`: This one surprises me a lot... my intuition really says
  #   `.xsession` should expect to use bash syntax. Kinda neat I guess...?
  #   - comes from
  #     ```
  #     shell=${SHELL:-sh}
  #     STARTUP="$shell $STARTUPFILE"
  #     ```
  #     in `50x11-common_dtermine-startup`
