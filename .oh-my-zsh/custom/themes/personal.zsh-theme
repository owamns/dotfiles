PROMPT='%F{#81A1C1}%n%f@%F{#D8DEE9}%m%f %F{#5E81AC}%~%f $(lf_status_nord)$(python_env_nord)$(git_status_nord)
%F{#A3BE8C}$%f '

lf_status_nord() {
  if [[ -n "$LF_LEVEL" ]]; then
    echo "%F{#5E81AC} lf%f "
  fi
}

python_env_nord() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%F{#8FBCBB}󱔎 $(basename $VIRTUAL_ENV)%f "
  fi
}

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %F{#4C566A}[ %F{#81A1C1}%b%F{#4C566A}]%f'

git_status_nord() {
  vcs_info
  echo "$vcs_info_msg_0_"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{#4C566A}[ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{#4C566A}]%f"

ZSH_THEME_GIT_PROMPT_ADDED="%F{#A3BE8C}+%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{#EBCB8B}*%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{#BF616A}-%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{#8FBCBB}»%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{#BF616A}!%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{#81A1C1}?%f"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{#B48EAD}⇡%f"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{#B48EAD}⇣%f"
