#!/bin/bash

# Main variables
dein_folder="$HOME/.cache/dein"
neovim_config="$HOME/.config/nvim"

# Dependencies *****************************************************************
#
# 1. Nvim
neovim_fail_msg="

  You can install neovim with:

    Ubuntu: sudo apt install nvim
    Arch:   pacman -S neovim

"
# 2. python
python_fail_msg="

  You can instal python provider with:
  
    Ubuntu: sudo apt install python3-pynvim
    Arch:   -

"
# 3. node.js
npm_fail_msg="
  
  You can install npm with:

    Ubuntu: sudo apt install npm
    Arch:   -

"
# 4. Clipboard
xclip_fail_msg="

  You can install xsel with:

    Ubuntu: sudo apt install xclip
    Arch:   -

"
# 5. ccls for c++
ccls_fail_msg="
  You can install support for C/C++ with:
    
    Ubuntu: sudo apt install ccls
    Arch:   - 

"

# nerd fonts
# select gui nerd font and size
# remake depenency installation
# add options to uninstall



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

msg()     { printf '%b\n' "$1" >&2; }
success() { msg "${Green}[✔]${Color_off} ${1}${2}"; }
info()    { msg "${Blue}[➭]${Color_off} ${1}${2}"; }
error()   { msg "${Red}[✘]${Color_off} ${1}${2}"; exit 1; }
warn ()   { msg "${Yellow}[⚠]${Color_off} ${1}${2}"; }

# Check if command exists
has_cmd () {
  if ! command -v $1 &> /dev/null
  then
    return 1
  else
    return 0
  fi
}

# Check dependencies ***********************************************************
check_dep () {
  if [ "$#" -ne 3 ]; then
    error "[check_dep] Illegal number of parameters."
  fi
  
  local dep_name=${1}
  local is_critical=${2}
  local fail_msg="Command '${dep_name}' could not be found.${3}"
  

  if has_cmd $dep_name; then
    success "Found '$dep_name'"
  else
    if [ $is_critical -eq 0 ]; then
      error "${fail_msg}"
    else
      warn "${fail_msg}"
    fi
  fi
}

check_python () {
  if [ "$#" -ne 3 ]; then
    error "[check_dep] Illegal number of parameters."
  fi
  
  local dep_name=${1}
  local is_critical=${2}
  local fail_msg="Python module '${dep_name}' could not be found.${3}"
  
  if python3 -c "import $dep_name"; then
    success "Found '$dep_name'"
  else
    if [ $is_critical -eq 0 ]; then
      error "${fail_msg}"
    else
      warn "${fail_msg}"
    fi
  fi
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
  info "Trying to clone the config"
  git clone https://github.com/szynka12/nvim.git "$neovim_config"
  if [ $? -eq 0 ]; then
    success "Successfully cloned"
  else
    error "Failed to cloned"
    exit 0
  fi
}


info "Checking dependecies:"

check_dep "nvim" "0" "$neovim_fail_msg"
check_python "pynvim" "1" "$python_fail_msg"
check_dep "npm" "1" "$npm_fail_msg"
check_dep "xclip" "1" "$xclip_fail_msg"
check_dep "ccls" "0" "$ccls_fail_msg"

install_package_manager
prep_config_folder
fetch_repo
