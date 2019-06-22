# vi mode
bindkey -v

bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey '^[[H' beginning-of-line
bindkey '^^[[H' backward-word
bindkey '^[[F' end-of-line
bindkey '^^[[F' forward-word
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey "^[[A" history-search-backward #up and down use search
bindkey "^[[B" history-search-forward #up and down use search
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
