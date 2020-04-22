# set -o vi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Exports

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export NODE_ENV=development
export MYVIMRC="~/.vimrc"
# export NVIM_TUI_ENABLE_TRUE_COLOR=1

#Variables
PATH_SCRIPTS="~/scripts"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  alias nv="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
export EDITOR="nvim"
  export VISUAL="nvim"
fi

# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
# KEYTIMEOUT=1
#
# VIM_PROMPT="❯"
# PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '
#
# prompt_pure_update_vim_prompt() {
#     zle || {
#         print "error: pure_update_vim_prompt must be called when zle is active"
#         return 1
#     }
#     VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
#     zle .reset-prompt
# }
#
# function zle-line-init zle-keymap-select { 
#     prompt_pure_update_vim_prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

source ~/.fzf-extras/fzf-extras.sh
source ~/dotfiles/zsim/zaliases
source ~/dotfiles/zsim/zfunctions
