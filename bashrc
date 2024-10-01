#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export LANG=en_US.UTF-8

# proxy on/off
function proxy_on() {
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    export all_proxy=http://127.0.0.1:7890
}

function proxy_off() {
    unset https_proxy
    unset http_proxy
    unset all_proxy
}

function pre_proxy() {
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    export all_proxy=http://127.0.0.1:7890
    $@
    unset https_proxy
    unset http_proxy
    unset all_proxy

}

alias proxyon='proxy_on'
alias proxyoff='proxy_off'
alias preproxy='pre_proxy'
alias proxytest='preproxy curl cip.cc'

# Gen passwd
function gen_passwd() {
    echo "This is a simple password generator"
    local len=${1:-16}
    for p in $(seq 1 5); do
        openssl rand -base64 48 | cut -c1-$len
    done
}