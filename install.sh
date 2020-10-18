#!/bin/bash

dein_folder="$HOME/.cache/dein"
neovim_config="$HOME/.config/nvim"

# Dependencies *****************************************************************
# 
# add python, node.js, clipboard
# check if you can check nvim health from the terminal
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

# Check for dependecy
# 
# $1 - name
# $2 - 
#check_dep () {
#}

check_shell_dependencies () {
  local dep=("$@")
  for d in ${dep[*]}; do
    need_cmd "$d"
    success "Found '$d'"
  done
}

# Install dein.vim *************************************************************

install_package_manager () {
  if [[ ! -d $dein_folder ]]; then
    mkdir -p $dein_folder
    info "Installing dein.vim"

    curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -o ./tmp_install.sh 
    sh ./tmp_install.sh $dein_folder
    rm ./tmp_install.sh
    
    success "dein.vim installation done"
  else
    error "You already have $dein_folder. Erease it before continuing."
  fi
}

uninstall_package_menager () {
  if [[ -d $dein_folder ]]; then
    info "Removing dein.vim"
    rm -r $dein_folder 
    success "dein.vim removed"
  fi
}

prep_config_folder () {
  if [[ -d $neovim_config ]]; then
    neovim_config_backup="${neovim_config}_back"

    if [[ -d $neovim_config ]]; then
      info "Backing up your neovim configuration in $neovim_config_backup"
      mv "$neovim_config" "$neovim_config_backup"
      info "Cleaning in $neovim_config"
      rm -rf "${neovim_config}/*"
    else
      error "You already have one backup in '$neovim_config_backup'. Erase it before continuing."
    fi

  else
    mkdir -p "$neovim_config"
    info "Making '$neovim_config' folder"
  fi
}

fetch_repo () {
  info "Trying to cloned the config"
  git clone https://github.com/szynka12/nvim.git "$neovim_config"
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
