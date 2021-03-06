################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

echo "* NodeJS scripts loading..."

export NODE_PATH=$NODE_PATH:/Users/andrew/.nvm/versions/node/v8.0.0/lib/node_modules:/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules

################################## npm ################################## 
# GLOBAL INSTALL
# alias nig="npm install -g"
alias nig="npm install --global"
alias nis="npm install --save"
alias nus="npm uninstall --save"
alias nisd="npm install --save-dev"
alias nusd="npm uninstall --save-dev"

alias nr="npm run" 
alias nrn="npm run nodemon"

alias nrnd="export LOG_LEVEL=debug; npm run nodemon"
alias nrnt="export LOG_LEVEL=trace; npm run nodemon"
alias nrns="export LOG_LEVEL=silly; npm run nodemon"
alias nrne="export LOG_LEVEL=error; npm run nodemon"

alias nrd="yarn run devops --"
alias nrdbd="yarn run devops -- build development"
alias nrdbp="yarn run devops -- build production"
alias nrddep="yarn run devops -- docker dockerhub"
alias nrdti="yarn run devops -- typings install"

alias imgen="script/imgen/imgen"
alias imgenmod="script/imgen/imgen create-module"
alias imgencanim="script/imgen/imgen create-can-immunize-component"

alias ni="npm install"

########## YARN ##########
alias yad="yarn add --dev"
alias yap="yarn add --peer"
alias yas="yarn add"
alias yrem="yarn remove"

# Install type definition with yarn
function yat() {
    if [[ -n "$1" ]]; then
        yarn add --dev "@types/$1"
    else
        echo "you must specify a module name to install type definitions"
    fi
}


############################### PROJECT CONVENIENCE FUNCTIONS ############################## 
alias cnc="./common-npm-commands"
alias mds="script/devops build development --clean"
alias sd="script/devops"
alias sdb="script/devops build"
alias sdbdev="script/devops build development --clean"
alias nkn_PARTIAL='ps aux | grep "tsc\|node\|webpack\|nvm\|npm\|gulp\|grunt\|cordova\|express\|commander" | grep -v "grep.*\(\(tsc.*node.*\)\|\(node.*tsc\)\)*" | xargs kill -9; pm2 stop all'
alias nkn='nkn_PARTIAL 2>/dev/null | grep -v "\(\(\Use \`pm2 show <id|name>\`.*details.*app\)\|\(┬─────┬\)\|\(┴─────┴\)\|\(App name.*mode.*cpu.*mem.*watching\)\)" | awk "{print $0}"'
#alias mds="make dev-setup"
#alias mdsr="make dev-setup; npm run nodemon"
#alias mpt="make populate-translations"
#alias mpl="make populate-lists"
#alias mg="make gulp"
#alias eri="make es-reindex-data"

#find version of globally installed package
alias npmpv="npm list -g | grep"

alias nodelist="ls /usr/local/lib/node_modules/; echo '-------------------------------------'; echo 'global node modules location:'; echo '/usr/local/lib/node_modules/'; echo '-------------------------------------';"

#information about npm and node modules [TOADD]
alias npminfo="npm config list"

#list all globally installed node modules [TOADD]
alias npmglist="npm list -g --depth=0"
alias npm_modules_g_list="npm list -g --depth=0"

alias npmkeyinfo="npm config ls -l | grep 'userconfig\|loglevel\|init-module\|cache\s\|^prefix\|shell\|node\-version\|globalignorefile\|globalconfig\|editor\|color' | rev | cut -d';' -f1 | rev | trim; npm config list | grep 'HOME\|cwd\|bin' | rev | cut -d';' -f1 | rev | trim"

#kill all node processes
alias killnode="ps axu | grep node | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"
#alias killnode="ps axu | grep node | awk '{print $2}' | sudo xargs kill -9"

#kill all gulp processes
alias killgulp="ps axu | grep gulp | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"

#kill all nodemon processes
alias killnodemon="ps axu | grep nodemon | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"

#kill all npm processes
alias killnpm="ps axu | grep npm | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"

#kill all node-related processes
alias bombnode="killnode; killgulp; killnodemon; killnpm"

# Run ts-node with nodemon
alias tsnodemon="nodemon --exec 'ts-node'"
alias ts_nodemon="tsnodemon" 

#overrides the one defined in bashrc_sys_util (snippets/scripts/sh/sys_util_scripts.sh)
alias nukenode='echo "from node_scripts.sh"; ps aux | ack "node|gulp|npm|nvm|grunt|cordova|mocha|webpack|babel|livereload|pm2" | ack -v "((tsserver)|(typingsInstaller\.js)|([0-9][0-9]\.[0-9][0-9]\sn?vim\s.*))" | awk "{print \$2}" | xargs kill -9; pm2 delete all; pm2 kill'
alias nukenodesrv="ps aux | grep node | grep -v 'gulp' | awk '{print \$2}' | xargs kill -9"
alias nukeember="ps aux | grep ember | awk '{print \$2}' | xargs kill -9"

alias murdernode='ps aux | grep "gulp\|node\|npm" | grep -v "atom" | awk "{print \$2}" | sudo xargs kill -9'
#alias murdernode='ps aux | grep "gulp\|node\|npm" | grep -v "atom" | cut -d" " -f2 | sudo xargs kill -9'
#alias murdernode="ps aux | grep '\(gulp\|node\|npm\)' | grep -v 'atom' | awk '{print $2}' | cut -d' ' -f2 | sudo xargs kill -9"

alias nun="nukenode"
alias nu="nukenode"
alias ns="npm start"
alias nns="nu; npm start"
alias nrt="npm run test"
alias nrc="npm run clean"

# view running NodeJS processes
alias anynode='ps aux | ack node'
alias pan='anynode'

# TODO Remove iSight-specific elements
# Clean error output from NodeJS process to be considerably more readable, and to emphasize most essential aspects
alias __slicesenerr_slicer="sed 's/     at/\n          at/g' | \
                    sed 's/trace=/\n\ntrace=/g'| \
                    sed 's/~\/Projects\/testbed\/testbed-seneca--4//g' | \
                    sed 's/, argv=/,\n    argv=/g' | \
                    sed 's/, rss=/,\n    rss=/g' | \
                    sed 's/, heapTotal=/,\n    heapTotal=/g' | \
                    sed 's/, loadavg=/,\n    loadargv=/g' | \
                    sed 's/ date=/\n    date=/g' | \
                    sed 's/ native=\(true\|false\), / /g' | \
                    sed 's/, stack=/,\n        /g' | \
                    sed 's/column=/\n       |---->COLUMN = /g' | \
                    sed 's/, line=/,\n       \\\---->  LINE = /g' | \
                    sed 's/       |---->COLUMN = /       ______________________________________________________________________________________________________________________\n       |---->COLUMN = /g' | \
                    sed 's/node_modules/\[nm\]/g' | \
                    sed 's/native=false\],/native=false\],\n     _______________________________________________________________________________________________________________________/g' | \
                    sed 's/, execPath=/,\n    execPath=/g' | \
                    sed 's/anonymous function/lambda/g' | \
                    sed 's/, pid=/,\n    pid=/g' | \
                    sed 's/, uid=/,\n    uid=/g' | \
                    sed 's/, gid=/,\n    gid=/g' | \
                    sed 's/, version=/,\n    version=/g' | \
                    sed 's/, uptime=/,\n    uptime=/g' | \
                    sed 's/, heapUsed=/,\n    heapUsed=/g' | \
                    sed 's/, cwd=/,\n    cwd=/g' | \
                    sed 's/trace=\[/  \x1b[31;1mTRACE::\x1b[39;49m/g' | \
                    sed 's/^\(        \)\(\[.*Error: .*,\)/\n\1\x1B[4;32m\2\x1b[0;39;49m/g' | \
                    sed 's/|.*| - error: \(uncaughtException\|\[seneca\]\).*$/\n\n\x1b[1;4;45m\n&::\x1b[0;39;49m\n  \x1b[31;1mENV:\x1b[39;49m/g'"

##### PICKS APART SENECA OUTPUT #####
function slicesenerr {
    cat $1 | __slicesenerr_slicer
}
#Note: '&' in sed in the 'replace' area (s/capture/replace/g) references 
#          whatever was captured in the capture area.
#       '\1' references the 1st parenthesized capture group, \2 the 2nd, and so on
#       see     http://www.grymoire.com/unix/sed.html
#####################################

alias goohritemplate="pushd $PROJECTS_DIR/ohri/mhealth-template-webapp"
alias go_ohritemplate="pushd $PROJECTS_DIR/ohri/mhealth-template-webapp"
alias go_mhealthtemplate="pushd $PROJECTS_DIR/ohri/mhealth-template-webapp"
alias go_templatemhealth="pushd $PROJECTS_DIR/ohri/mhealth-template-webapp"
alias gomhealthtemplate="go_templatemhealth"
alias go_v2mhealthtemplate="pushd $PROJECTS_DIR/ohri/module-testbed/v2-mhealth-template-webapp"
alias gov2mhealthtemplate="go_v2mhealthtemplate"
alias go_authmodule="pushd $PROJECTS_DIR/ohri/auth-handler"
alias goauthhandler="pushd $PROJECTS_DIR/ohri/auth-handler"
alias go_basic_js_template="pushd $PROJECTS_DIR/own-projects/node-react-boiler-simple"
alias go_javelinscript="pushd $PROJECTS_DIR/ohri/CANImmunize-Javelinscript"
alias gojavelinscript="pushd $PROJECTS_DIR/ohri/CANImmunize-Javelinscript"
alias gotemplate="pushd $PROJECTS_DIR/own-projects/node-react-boiler-simple"
alias gowebclient="pushd $PROJECTS_DIR/ohri/canimmunize-web-client-v2"
alias gologs="pushd $PROJECTS_DIR/new_node_modules/mad-logs"
alias goenvvarhelpers="pushd $PROJECTS_DIR/new_node_modules/env-var-helpers"
alias go_errorsmith="pushd $PROJECTS_DIR/ohri/errorsmith"
alias goerrorsmith="pushd $PROJECTS_DIR/ohri/errorsmith"

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EMBER ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias es="nukeember; ember server"            # start ember server at port 4200
# alias es='eserv | ack -v "(^[0-9]+\serrors?$)|(^.*JSHint.*)|(^[a-zA-Z\._]+.*\.js:\sline\s[0-9]+,\scol\s[0-9]+,\s.*\.)"'
alias esp="ember server --port"    # start ember server at given port #
alias eg="ember generate"          # generate something with ember
alias et="ember test --server"     # run ember tests
alias egr="ember generate route"   # generate route with given name
alias egm="ember generate model" #name_of_model
alias egcom="ember generate component" #name-of-component
alias egcon="ember generate controller" #name-of-controller
alias egh="ember generate helper" #name-of-helper - usually matches a model
alias egserv="ember generate service" #name-of-service
alias egutil="ember generate util" #name-of-util
alias egt="ember generate template" #name-of-template

function egvc {
    ember generate route $1
    # ember generate template $1
    ember generate controller $1
}

function egmvc {
    ember generate route $1s
    # ember generate template $1s
    ember generate model $1
}

function rm_char {
    CHAR_TO_REMOVE = $1
    awk "{gsub(/$1/,\"\",\$0); print \$0}"
    unset CHAR_TO_REMOVE
}

# remove ALL double quotes from a string, from beginning to end
function rm_double_quotes {
    awk '{gsub(/"/,"",$0); print $0}'
}

# list ember addons & dependencies used in current project. Finds package.json,
# extracts info from it.
function emb_proj_deps {
    MAX_LENGTH=$(cat package.json | awk '{print length($1)}' | sort -n | tail -n1)
    cat package.json | ack "\"ember-.+\".?:.?.?\".+\"" | trim | sort | awk '{print $1" "$2}' | column -t -s: | awk '{printf "%'$MAX_LENGTH's    %-11s\n", $1, $2}' | rm_double_quotes
    unset MAX_LENGTH
}

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VERSION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias node_version='echo "$(eval node -v)" > .node-version' # set current version of node as project root node version

# alias slicesenerr="cat test.txt | sed 's/     at/\n          at/g' | sed 's/trace=/\n\ntrace=/g'| sed 's/column=/\n    ---->COLUMN = /g' | sed 's/\/home\/andfaulkner\/Projects\/testbed\/testbed-seneca--4//g' | sed 's/, execPath=/,\n  execPath=/g' | sed 's/, argv=/,\n  argv=/g' | sed 's/, rss=/,\n  rss=/g' | sed 's/, heapTotal=/,\n  heapTotal=/g' | sed 's/, loadav
#alias slicesenerr="cat test.txt | sed 's/     at/\n          at/g'" 

#enables completion for npm commands in cli
. <(npm completion)

# ensure proper node version loads based on value in .node-version in project folder
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#nvm use v6.7.0

alias ember_dep_surge="rm -rf dist; ember build --environment=development; cd dist; cp index.html 200.html; surge" # if site already exists, provide it here 


####################################################################################################
################################### NEW NODE PROJECT GENERATORS ####################################
####################################################################################################
source "$SNIPPETS_DIR/scripts/sh/project-generators/node_project_generation_scripts.sh"

alias typescript='find . -name "*.ts" | xargs tsc -w'

# customized REPL. Provides certain preloadingactions as present in repls like irb
alias irjs='"$SNIPPETS_DIR/dev-env/nodejs/irjs/irjs"'

########### TYPESCRIPT #############
function type_install_global {
    typings install --global --save "dt~$1"
}

alias tig="type_install_global"

function tnisd {
    set -o nounset
    (npm install $1 --save-dev) && (typings install --global dt~$1 || typings install --global npm~$1 || typings install npm~$1 || typings install dt~$1 || npm install --save @types/$1 || (echo "WARNING: NO TYPE DEFINITION FOUND FOR $1."))
    set +o nounset
}

function tnis {
    set -o nounset
    (npm install $1 --save) && (typings install --global dt~$1 || typings install --global npm~$1 || typings install npm~$1 || typings install dt~$1 || npm install --save @types/$1 || (echo "WARNING: NO TYPE DEFINITION FOUND FOR $1. Uninstalling $1." && npm uninstall --save $1))
    set +o nounset
}


alias npmscripts='awk "/scripts/,/}/" package.json | ack -v "\s\s}" | ack -v "\s\s\"scripts\":"'
alias npmreact_deps='cat package.json | ack "react|redux|recompose|jsdom|reselect|normalizr|enzyme|jest|updeep|reduce-reducers|mobx" | trim'

alias twitter="echo 'logging into twitter via birdknife...'; birdknife"


alias electronrun="~/.yarn-cache/.global/node_modules/electron/dist/Electron.app/Contents/MacOS/Electron"

# increase the current node version
function bump_node {
    tir "/Users/andrew/Library/Application Support/Sublime Text 3/Packages/User/SublimeLinter.sublime-settings" --replace "\.nvm\/versions\/node\/v[0-9]\.[0-9]\.[0-9]\/" ".nvm/versions/node/v$1/"
    tir "/Users/andrew/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings" --replace "\.nvm\/versions\/node\/v[0-9]\.[0-9]\.[0-9]\/" ".nvm/versions/node/v$1/"
}

#
# Full publication workflow for npm utility modules
#   1. Change the version & the tag on the repo url in package.json to the given semver number
#   2. Add, commit, and push the package.json change to master,
#         commit message states what version it's being bumped to
#   3. Create a git tag with said number (preceded by v), and push it to github.
#   4. Publish the package to npm
#
# EXAMPLE: npm_tag_publish_version 0.31.2
#   - Results in package.json:
#      ...
#      "repository": {
#          "type": "git",
#          "url": "git+https://github.com/andfaulkner/misc-ts-utils-isomorphic.git#v0.31.2"
#      },
#      "version": "0.31.2"
#      ...
#   - Commits change to package.json in master branch with message 'Bump to version 0.31.2'
#   - creates git tag v0.31.2
#   - publishes package version 0.31.2 to npm
#
# Note: requires 'tir' text replacement utility to be in your environment
#
npm_tag_publish_version() {
    tir package.json --replace "\"version\": \"[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\"," "\"version\": \"$1\","
    tir package.json --replace "\.git#v[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\"" ".git#v$1\""
    rm ./package.json__bk # Remove automatic backup file created by tir
    git add package.json
    git commit -m "Bump to version $1"
    git push origin master
    git tag v$1;
    git push origin v$1;
    npm publish
    echo "Published v$1 of $(curdir)!"
}

alias weather="node /Users/andrew/projects/new_node_modules/weather/weather.js"

########## CouchDB ###########
alias nukecouchdb="ps aux | ack couchdb | awk '{print \$2}' | sudo xargs kill -9"

# alias npm_ver_inc="jq .version package.json | ruby -e 'puts STDIN.first.split(/[.\"]/).join.to_i+1'"
# alias npm_git_tag_w_ver='git tag v"$(jq .version package.json | sed -e \'s/^"//\' -e \'s/"$//\')"'
alias npm_git_tag_w_ver="git tag v\"\$(jq .version package.json | sed -e 's/^\"//' -e 's/\"$//')\""
# alias npm_bumptag="versiony patch; npm_git_tag_w_ver; git tag;"
# alias npm_bumptagpush="git add --all; git commit --all -m 'fixes before a bump'; versiony patch; git commit --all -m 'bump'; npm_git_tag_w_ver; git tag; git push origin \"v\$(jq -r .version package.json)\""

alias npm_get_cur_proj_version='cat package.json | ack "\"version\": \"[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\","'

echo "* NodeJS scripts loaded!"

# yard is also a type of ruby gem
# alias yard="yarn"

alias npm_hasmodule='cat package.json | ack'
alias npm_mymodules='cat package.json | ack --no-color "\"((mad-logs)|(mad-utils)|(@ottawamhealth\/canimmunize-kavalinscript)|(env-var-helpers)|(common-constants))\"":'
alias mymoduleversions='npm_mymodules'

alias npm_mymodulesall='cat package.json | ack --no-color "\"((mad-logs)|(mad-utils)|(@ottawamhealth\/[a-zA-Z-_$]+)|(kidnap-console)|(env-var-helpers)|(errorcatcher)|(common-constants))\"":'

alias yarn_ottawamhealth_upgrade_main_internal_libs="yarn upgrade mad-utils mad-logs env-var-helpers @ottawamhealth/canimmunize-javelinscript; echo 'If required, you can also install @ottawamhealth/auth-handler next - it was left out due to having had significant breaking changes across versions. Be sure to upgrade it very carefully. Cmd:\n    yarn upgrade @ottawamhealth/auth-handler'"

