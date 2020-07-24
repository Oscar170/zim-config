export NVM_DIR="$HOME/.nvm"

function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$ZIM_HOME/modules/z/z.sh"

  _z "$1"
}

function load_nvm() {
	fname=$(declare -f -F nvm)

	[ -n "$fname" ] || source "$NVM_DIR/nvm.sh"

	nvm "$@"
}

function dlist() {
	local containers=$(docker ps | awk '{if (NR!=1) print $1 " -> " $(NF)}')

	echo $containers
}

function dconnect() {
	local containerId=$(docker ps | awk '{if (NR!=1) print $1 " -> " $(NF)}' | fzf | awk '{print $1}')

	docker exec -i -t $containerId /bin/bash
}

function cdf() {
	local folder=$(for i in $(ls -d */); do echo ${i%%/}; done | fzf --height=30%)

	cd "$folder"
}

_reverse_search() {
	local selected_command=$(fc -rl 1 | awk '{$1="";print substr($0, 2)}' | fzf --height=40%)

	LBUFFER=$selected_command
}

function gpush() {
	git add . && git commit -m "$1" && git push
}

zle -N _reverse_search
bindkey '^r' _reverse_search
