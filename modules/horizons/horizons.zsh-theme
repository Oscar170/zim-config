# vim:et sts=2 sw=2 ft=zsh
#
# A customizable version of the steeef theme from
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/steeef.zsh-theme
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

_prompt_steeef_venv() {
  if [[ -n ${VIRTUAL_ENV} ]] print -n " (%F{blue}${VIRTUAL_ENV:t}%f)"
}

# use extended color palette if available
if (( terminfo[colors] >= 256 )); then
  : ${USER_COLOR=135}
  : ${HOST_COLOR=166}
  : ${PWD_COLOR=cyan}
  : ${BRANCH_COLOR=red}
  : ${UNINDEXED_COLOR=166}
  : ${INDEXED_COLOR=118}
  : ${UNTRACKED_COLOR=161}
else
  : ${USER_COLOR=magenta}
  : ${HOST_COLOR=yellow}
  : ${PWD_COLOR=green}
  : ${BRANCH_COLOR=cyan}
  : ${UNINDEXED_COLOR=yellow}
  : ${INDEXED_COLOR=green}
  : ${UNTRACKED_COLOR=red}
fi
: ${UNINDEXED_IND=●}
: ${INDEXED_IND=●ˆ}
: ${UNTRACKED_IND=●}
VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:dirty' format '✗'
  zstyle ':zim:git-info:ahead' format '⇡'
  zstyle ':zim:git-info:behind' format '⇣'

  zstyle ':zim:git-info:keys' format \
      'prompt' ' %F{blue}git(%f%F{red}%b%f%F{blue})%f%s %F{yellow}%D%A%B%f'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

# local CURSOR='%(?:%F{green}:%F{red})➜%f'
local CURSOR='%(?:%F{green}:%F{red})%Bλ%b%f'

PS1='
 %F{${PWD_COLOR}}%~%f%B${(e)git_info[prompt]}%b$(_prompt_steeef_venv)
 %(!.#.${CURSOR}) '
unset RPS1
