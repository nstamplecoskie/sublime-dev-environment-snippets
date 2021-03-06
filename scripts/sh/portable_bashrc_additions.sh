##### ENSURE ALL TERMINALS WRITE TO SINGLE HISTORY FILE #####
#shopt -s histappend;
#PROMPT_COMMAND="history -a;history -c; history -r;$PROMPT_COMMAND"
# Create effectively-infinite-length bash history file
HISTSIZE=500000 HISTFILESIZE=5000000

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~ LOAD OTHER SOURCE SCRIPTS ~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
_def_all_srcs_() {
    local CUR_LANG=$1
    local CUR_LANG_LC="$(echo $CUR_LANG | tr '[:upper:]' '[:lower:]')"
    local CUR_LANG_UC="$(echo $CUR_LANG | tr '[:lower:]' '[:upper:]')" 
    local SCRIPTS_FILE="$SNIPPETS_DIR/scripts/sh/${CUR_LANG_LC}_scripts.sh"
    eval "${CUR_LANG_UC}_SCRIPTS=\"$SCRIPTS_FILE\""
    eval "alias bashrc_${CURLANG_LC}='vim \"$SCRIPTS_FILE\"'"
    eval "source \"\$${CUR_LANG_UC}_SCRIPTS\""
}

_def_all_srcs_ android
_def_all_srcs_ git 
_def_all_srcs_ ruby 
_def_all_srcs_ node
_def_all_srcs_ clojure
_def_all_srcs_ python
_def_all_srcs_ elixir
_def_all_srcs_ elm
_def_all_srcs_ crystal 
_def_all_srcs_ search
_def_all_srcs_ web
_def_all_srcs_ sys_util

MISC_CLI_OPTIONS="$SNIPPETS_DIR/scripts/sh/cli_opts.sh"
PORTABLE_BASHRC_ADDITIONS="$SNIPPETS_DIR/scripts/sh/portable_bashrc_additions.sh"
TEMPLATES_DIR="$SNIPPETS_DIR/scripts/sh/templates"

# LANGUAGE- OR TOOL-SPECIFIC SCRIPT SOURCES
source "$MISC_CLI_OPTIONS"
source ~/.profile

# EDIT OTHER SCRIPT SOURCES
alias bashrc_sysportable='vim "$PORTABLE_BASHRC_ADDITIONS"'
alias bashrc_cli='vim "$SNIPPETS_DIR/scripts/sh/cli_opts.sh"'
alias bashrc='vim "$PORTABLE_BASHRC_ADDITIONS"'

# LOAD 'MODULES'
source "$SNIPPETS_DIR/scripts/sh/bash_modules/module_File.sh"

# LOAD 'MANUALS'
PATH=$PATH:"$SNIPPETS_DIR/custom-manuals"

# LOAD LOCAL BINARIES
PATH=$PATH:"~/bin"

################################################################################


################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ QUICKNAV ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias back="echo 'DIR returning from:'; pwd; popd; echo 'DIR returned to:'; pwd"

alias go_android_tools="pushd ./; cd $HOME/Library/Android/sdk; ls -ao; echo ''; pwd"

alias downloads="pushd \"$HOME/Downloads\""
alias documents="pushd \"$HOME/Documents\""
alias proj="pushd \"$HOME/projects\""
alias goproj="pushd \"$HOME/projects\""
alias goprojects="pushd \"$HOME/projects\""
alias anproj="pushd \"$HOME/projects/android\""
alias goelectron="pushd \"$HOME/projects/electron\""

alias godocs="pushd \"$HOME/Documents\""
alias godownloads="pushd \"$HOME/Downloads\""
alias gobinhome="pushd \"$HOME/bin\""

alias govimsetup="pushd \"$HOME/.config/nvim/\""

alias go_madutils="pushd \"$HOME/projects/new_node_modules/mad-utils\""
alias gomadutils="go_madutils"
alias goutils="go_madutils"
alias go_utils="go_madutils"

alias go_madlogs="pushd \"$HOME/projects/new_node_modules/mad-logs\""
alias gomadlogs="go_madlogs"
alias go_log_lib="go_madlogs"

## super-ls
alias lsa='ls -ao | grep -v "[0-9][0-9] \.\.\?$"'

## lsa for dirs only
alias lsda='lsa | ack "^d" | awk "{print}"' 

## ls for dirs only
# alias lsd='lsa | ack "^d" | awk "{print $9}"'
alias lsd="lsa | ack '^d' | awk '{print \$8}'"

## use nvim instead
alias vim="nvim"
## handy vim shortcut
alias v="nvim"

alias devenvedit='vim "$SNIPPETS_DIR/dev-env/devenv-install.sh"'

alias _="\!\!"

function whereami {
    ls -ao
    PWD__TEMP__WHEREAMI=`pwd`
    echo $PWD__TEMP__WHEREAMI
    echo ""
    echo "****************************************************************************"
    echo "current git branch:"
    git status | head -1 | awk '{print $3}'
    echo "****************************************************************************"
    echo ""
    git status
}

function projinfo {
    echo ""
    whereami
    echo ""
    echo *** GEMS INSTALLED IN PROJECT::: ***
    cat Gemfile | ack "^ *gem.*" | sort
    #echo ""
    #echo **** RAKE TASKS AVAILABLE::: ****
    #bundle exec rake -T
}

#alias rbash=". ~/.bash_profile"

function whichdir {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_parent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_grandparent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_greatgrandparent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_greatgreatgrandparent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.plit(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

alias whichdir_parent_up1="whichdir_parent"
alias whichdir_parent_up2="whichdir_grandparent"
alias whichdir_parent_up3="whichdir_greatgrandparent"
alias whichdir_parent_up4="whichdir_greatgreatgrandparent"

function newmanual {
    cp "`which man__TEMPLATE`" "`whichdir man__TEMPLATE`/man__$1"
    vim "`whichdir man__TEMPLATE`/man__$1"
}

alias rol_linecount="ruby -ne 'END {puts $.}'"

alias rol_out_linecount="ruby -pe 'END {puts \"\n#{$.}\"}'"

# for use with ps aux - when piped into this, removes references to chrome
function nochrome {

    ruby -pe '$_ = "" if $_.match(/\/opt\/google\/chrome\/chrome/)'
}

# List all shell variables defined in a file that contain a route to a directory
# Excludes PATH variables.
# @param $1 A shell file
function rol_get_shdirvars {
    cat $1 | ack "\/" | ack "^[A-Z]+" | ruby -pe '$_ = $_.split("=").first + "\n"' | uniq | ack -v "^PATH$"
}

# Expand a shell variable - within a pipe
function rol_expand_shdir_vars {
  eval echo $(ruby -pe '$_ = "$" + $_')
}

# get all paths to source $SOME_SOURCE - referenced scripts in a shell file
function rol_get_bash_sources_from_vars {
  cat $1 | ack 'source \$' | eval echo $(ruby -pe '$_ = "$" + $_')
}

# get all paths to source /some/path/here.sh -referenced scripts in a shell file
function rol_get_bash_sources_from_paths {
  cat $1 | ack 'source' | ack -v 'source \$' | awk '{print $2}' | ack -v "rbenv.bash"
}

# show all your aliases
function show_aliases {
  cat ~/.bashrc > ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_vars ~/.bashrc | xargs >> ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_paths ~/.bashrc | xargs >> ~/.all_src_scripts_tmp_holder
  cat ~/.bash_profile >> ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_vars ~/.bash_profile | xargs >> ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_paths ~/.bash_profile | xargs >> ~/.all_src_scripts_tmp_holder
  cat ~/.all_src_scripts_tmp_holder | ack '^alias' | sort
  rm ~/.all_src_scripts_tmp_holder
}

function show_aliases_mac {
  cat ~/.bashrc > ~/.all_src_scripts_tmp_holder
  cat ~/.bash_profile >> ~/.all_src_scripts_tmp_holder
  cat "$SNIPPETS_DIR/" >> ~/.all_src_scripts_tmp_holder
  cat ~/.
}

# store all scripts in a single temporary file
function list_dir_files {
  #grab all "path to bash source script" containing vars from .bashrc, cat all files within
  rol_get_shdirvars ~/.bashrc | eval cat $(ruby -pe '$_ = "$" + $_' | sudo ack ".sh") > ~/.tmp_bash_source_scripts_storage
  cat ~/.bash_profile >> ~/.tmp_bash_source_scripts_storage
  cat ~/.bashrc >> ~/.tmp_bash_source_scripts_storage
}

# Remove colour from streaming output
# @example ps aux | ack 'Chrome' |  strip_color
#          -> shows list of Chrome-related processes, without "Chrome" highlighted
alias strip_color="sed \"s,\$(printf '\033')\\[[0-9;]*[a-zA-Z],,g\""

#insert text at beginning of file
#Usage:
#    insertfirstline path/to/file.ext "text to insert before 1st line of file"
function insertfirstline {
    echo $2 | cat - $1 > temp && mv temp $1
}

####### CASING #######
# Text streamed through gets switched to lowercase
alias str_lowercase="tr '[:upper:]' '[:lower:]'" 

# Text streamed through gets switched to uppercase
alias str_uppercase="tr '[:lower:]' '[:upper:]'" 

# get the file extension
# @param $1 - path/to/file.ext
# @returns file extension, excluding the dot. E.g. js
function file.gettext {
    echo "${1##*/}" | awk -F. '{print $NF}'
}

# Get first line of given file
function file.get_first_line {
  cat $1 | awk 'NR==1'
}

# Get text of given line number
function file.get_line { #arg1: filename; arg2: line
  cat $1 | awk "NR==$2"
}

############# Bash completion ###############
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
	. $(brew --prefix)/etc/bash_completion
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#############################################

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load .bashrc file
case $- in
   *i*) source ~/.bashrc
esac

alias vimrc="vim ~/.config/nvim/init.vim"

## Open Sublime Text 3
alias sublime="open /Applications/Sublime\ Text.app"

## Open file in Sublime Text 3
function open_in_sublime {
    echo "** opening $1 in sublime text 3"
    sublime --project "$1"
}

## ps aux | ack ... shorthand
pa() {
    ps aux | ack $1 | ack -v "perl \/.+bin\/ack"
}

alias gogameimmunitywarriors="cd $PROJECTS_DIR/own-projects/immunity-warriors-game"

