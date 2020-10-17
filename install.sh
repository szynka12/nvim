#!/bin/bash

# Dependencies *****************************************************************

dependeds_on_shell=("nvim" "ccls")
fonts=("") # check how to do fonts

# Colors for the preety terminal output ****************************************
#
# This was taken from the SpaceVim install script
Color_off='\033[0m'       # Text Reset

# terminal color template {{{
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Messages and informations ****************************************************
#
# Also stolen form SpaceVim install script. Check it out it is awesome!

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
    msg "${Blue}[➭]${Color_off} ${1}${2}"
}

error() {
    msg "${Red}[✘]${Color_off} ${1}${2}"
    exit 1
}

warn () {
    msg "${Yellow}[⚠]${Color_off} ${1}${2}"
}


need_cmd () {
    if ! command -v $1 &> /dev/null
    then
      error "Command '$1' could not be found!"
      exit 1
    fi
}

# Check dependencies ***********************************************************

check_shell_dependencies () {
  local dep=("$@")
  for d in ${dep[*]}; do
    need_cmd "$d"
    success "Found '$d'"
  done
}

# Install dein.vim *************************************************************

install_package_manager () {
    if [[ ! -d "$HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim" ]]; then
        info "Installing dein.vim"
        git clone https://github.com/Shougo/dein.vim.git $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim
        success "dein.vim installation done"
    fi
}

uninstall_package_menager () {
    if [[ -d "$HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim" ]]; then
        info "Removing dein.vim"
        rm -r $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim
        success "dein.vim removed"
    fi
}

prep_config_folder () {
  if [[ -d "$HOME/.config/nvim" ]]; then
      info "Backing up your neovim configuration in '$HOME/.config/nvim_back'"
      mv "$HOME/.config/nvim" "$HOME/.config/nvim_back"
      mkdir "$HOME/.config/nvim"
    else
        mkdir -p "$HOME/.config/nvim"
        info "Making '$HOME/.config/nvim/' folder"
    fi
}

fetch_repo () {
  info "Trying to cloned the config"
  git clone https://github.com/szynka12/nvim.git "$HOME/.config/nvim"
  if [ $? -eq 0 ]; then
    success "Successfully cloned"
  else
    error "Failed to cloned"
    exit 0
  fi
}


check_shell_dependencies "${dependeds_on_shell[@]}"
install_package_manager
prep_config_folder
fetch_repo
