# load custom executable functions
source ~/.zsh/antigen.zsh

export ANTIGEN_CACHE=~/.cache/antigen
antigen init ~/.zsh/.antigenrc

# TODO these need to be moved to the actual keybinds config file
bindkey -v

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up 
bindkey -M vicmd 'j' history-substring-search-down

for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/config"

# Local config
[[ -f ~/.zshrc.local ]] && echo $blue "Loading ~/.zshrc.local..." && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
