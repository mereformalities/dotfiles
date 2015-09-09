alias e=mate
VISUAL="mate -w"
export VISUAL

# export EDITOR='subl --new-window --wait'
# export VISUAL='subl --new-window --wait'
# alias e='subl --new-window'

# export EDITOR='vim'
# export VISUAL='vim'
# alias e='vim'

mac=/usr/local/bin:/usr/local/sbin
etc=$HOME/dev/etc/dotfiles/bin
dev=$HOME/dev/bin
git=/usr/local/git
postgres=/Applications/Postgres.app/Contents/Versions/9.4/bin
mysql=/usr/local/mysql/bin
andsdk=$HOME/Library/Android/sdk
andtools=$andsdk/tools
andptools=$andsdk/platform-tools
mamp=/Applications/MAMP/bin/php/php5.4.10
buildtools=23.0.0

# Set path
export PATH=$mac:$etc:$dev:$git:$mamp:$postgres:$mysql:$andtools:$andptools:$PATH
export MANPATH=/usr/local/man:$MANPATH
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export DISPLAY=:0.0

# Git branch prompt
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export PS1="\[\e[32m\]\$(parse_git_branch)\[\e[36m\]\w> \[\e[m\]"

# Simple prompt
# export PS1="\w> "

# History security features
export HISTCONTROL=ignorespace:ignoredups

# Tune Ruby GC (http://stackoverflow.com/a/16304076)
# Ruby 1.9.3+
export RUBY_GC_MALLOC_LIMIT=49000000
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_FREE_MIN=100000
# Ruby 2.1.0+
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_GC_HEAP_FREE_SLOTS=100000
export RUBY_GC_HEAP_GROWTH_FACTOR=1

# http://javapapo.blogspot.com/2013/02/multiple-java-jdks-on-your-macosx.html
export JAVA_6_HOME=$(/usr/libexec/java_home -v1.6)
export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)

# Switch Java environments
alias java6="export JAVA_HOME=$JAVA_6_HOME"
alias java7="export JAVA_HOME=$JAVA_7_HOME"
alias java8="export JAVA_HOME=$JAVA_8_HOME"

# Fix psql
alias psql="$postgres/psql"
      
# Navigation
alias cb="cd $OLDPWD"
alias back=cb
alias ..="cd .."
alias ...="../.."
alias home="cd ~"
alias dev="cd ~/dev"
alias desktop="cd ~/Desktop"

# Development
alias stopkiq="ps -ef | grep 'sidekiq' | awk '{print $2}' | xargs kill -9"
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias rvmtest="type rvm | head -n 1"
alias migratedown="rake db:migrate VERSION=0"
alias migrate="rake db:migrate"

# Commands
alias hist="history 44"
# alias wget="curl -O"
alias h=hist
alias scripts="cd ~/dev/etc/dotfiles/bin" 
alias path="echo $PATH"
alias lsd="/bin/ls -d */"
alias la="/bin/ls -l"
alias lsa="ls -la"
alias ls="ls -aF"
alias ll="ls -l"
alias mv="mv -i"
alias cp="cp -p"
alias psv="ps ux"
alias psfind="ps -axw | grep "
alias mkdir="mkdir -p -v" 
alias stop="sudo kill -3"    
alias forcequit="sudo kill -9"
alias ff="find . -type f -name "
alias env="printenv|sort"
alias chmod="chmod -vv"
alias chmodx="chmod 755"
alias makeexe="chmod u+x"
alias ping="ping -nc 10 "
alias mount_ro="mount -o ro,remount"
alias mount_rw="mount -o rw,remount"
alias tarit="tar -cvf"
alias untar="tar -xvf"
alias download="curl -O"
alias disk="du -s -k -c * | sort -rn" # output in kb 
alias top="top -FRo" # cpu, vsize, rsize
alias topcpu="top cpu"
alias topmem="top vsize" 
alias unlock="sudo chflags nouchg"
alias relock="sudo chflags uchg" 
alias flushdns="dscacheutil -flushcache"

# Processes
alias tu='top -o cpu' # cpu
alias tm='top -o vsize' # memory

# Config
alias rebash="source ~/.profile"
alias edprof="e ~/.profile"
alias edhosts="e ~/private/etc/hosts"
                        
# Rails
alias debug="tail -f -44 log/development.log"
alias repow="touch tmp/restart.txt"
alias restart="repow"
alias rc="bundle exec rails c"

# Node
alias npmg="npm -g"
alias npml="npm -g list"

# Sublime
# alias subl="/Applications/Sublime\ Text 2.app/Contents/SharedSupport/bin/subl"

# Versioning
alias gitmm="git merge origin/master --no-commit"
alias uncommit="git reset --soft HEAD~1"
alias rmcommit="git reset --hard HEAD~1"
alias gs="git status"
alias ga="git add"
alias gau="git add -u"
alias gap="git add -p"
alias gmv="git mv"
alias grm="git rm"
alias gb="git branch"
alias gco="git checkout"
alias gcom="git checkout master"
alias gnew="git checkout -b"
alias theirs="git checkout --theirs"
alias mine="git checkout --mine"
alias gpick="git cherry-pick"
alias grevert="git checkout -p"
alias gdiff="git diff HEAD~1"
alias ghist="git log -n 5"
alias glog="git log"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias svndr="svn merge --dry-run -r BASE:HEAD ."
alias svnignore="svn propedit svn:ignore"

# Xcode
alias resetdiff="sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer/"
alias crashes="open ~/Library/Logs/DiagnosticReports/"

# Android
alias aapt="$andsdk/build-tools/$buildtools/aapt"
alias badging="$aapt dump badging"
# alias applog="adb -d logcat com.mybiz.appname:D *:S"
alias droidlog="adb logcat *:E"
alias devices="adb devices"

# Copy gist file to a local file
function gist_copy {
    gist=$1
    path=$2
	if [ "$gist" != "" ]; then
        curl -L https://gist.github.com/$gist/download
        if [ "$path" != "" ]; then
            cp download $path
        fi
    fi
}

# Find in history
function histfind {
	# arg_1 = search term
	history | grep -i "$1"
}

# Run shell script
function run {
	if [ "$1" != "" ]; then
    	~/dev/bin/$1.sh
	fi
}

# Run apple script
function script {
	if [ "$1" != "" ]; then
    	osascript ~/dev/script/$1.scpt
	fi
}

# Ruby version and gemset
function rubyenv {
	local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
	local   build=$(echo $MY_RUBY_HOME | awk -F'-' '{print $3}')
	[ "$version" != "" ] && version="ruby-$version-$build"
	local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
	[ "$gemset" != "" ] && gemset="@$gemset"
	local full="$version$gemset"
	[ "$full" != "" ] && echo "$full "
}

# Init a cocoapods project
function podinit {
	# First rubyinit
	rvm --create --ruby-version use $version
	# Ensure cocoapods is installed
	sudo gem install cocoapods
	# Check where it ended up
	which pod
	# Add a Podfile
	if [ ! -f "Podfile" ]; then
		echo -e 'source "https://github.com/CocoaPods/Specs.git"' > Podfile
		pod install
	fi
}

# Open the directory's xcworkspace
function work {
	target="."
	if [ "$1" != "" ]; then
		target=$1
		cd $target
	fi
	workspace=`find $target -maxdepth 1 -name "*.xcworkspace" | head -1`
	if [ "$workspace" != "" ]; then
		open $workspace
	fi
}

# Open a new tab on Terminal with the current working dir
function newtab {
	osascript -e "
		tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
		tell application \"Terminal\" to do script \"cd \\\"$(PWD)\\\"\" in selected tab of the front window
	" > /dev/null 2>&1   
	# run arg
	if [ "$1" != "" ]; then
		osascript -e "
			tell application \"Terminal\" to do script \"$1\" in selected tab of the front window
		" > /dev/null 2>&1		
	fi
}

# Find a file on the local system
function findin {
	# arg_1 = directory
	# arg_2 = search regex
	if [[ -z "$1" || -z "$2" ]]; then
		echo "Usage: findin directory matcher"
		return
	fi
	sudo find $1 -name $2 -print
}


# Bash key shortcuts (after bindings below are added)
#
# up,down    - get match from history
# ^d         - delete current line
# ^u         - delete everything to left
# ^k         - delete everything to right
# ^l         - clear screen
#
# Use 'read' command to find out what the bindings are for a particular
# key, but replace the initial '[' with '\e'.
#
# Modify input bindings to use history better
#
# bind '"\e[A"':history-search-backward
# bind '"\e[B"':history-search-forward
# bind '"\code-d"':kill-whole-line
# bind '"\e[3~"':delete-char


# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load rvm into shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Load nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
