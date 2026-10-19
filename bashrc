#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export LANG=en_US.UTF-8

# proxy on/off
proxy_url=http://localhost:20122
function proxy_on() {
    export https_proxy=${proxy_url}
    export http_proxy=${proxy_url}
    export all_proxy=${proxy_url}
}

function proxy_off() {
    unset https_proxy
    unset http_proxy
    unset all_proxy
}

function pre_proxy() {
    proxy_on
    $@
    proxy_off
}

alias proxyon='proxy_on'
alias proxyoff='proxy_off'
alias preproxy='pre_proxy'
alias proxytest='preproxy curl cip.cc'

# gen passwd
function gen_passwd() {
    echo "This is a simple password generator"
    local len=${1:-16}
    for p in $(seq 1 5); do
        openssl rand -base64 48 | cut -c1-$len
    done
}

# gen port
function gen_port() {
    while :; do
        PORT=$(shuf -i 1024-65535 -n 1)
        ss -lnt | grep -q ":$PORT " || break
    done

    echo "Available port: $PORT"
}

# 清理 SSH known_hosts 指定 IP/域名
clean_ssh() {
    if [ -z "$1" ]; then
        echo "用法: cleanssh <IP 或域名>"
        return 1
    fi

    local TARGET="$1"
    local KNOWN_HOSTS="$HOME/.ssh/known_hosts"

    echo "===> 清理 SSH host key: $TARGET"

    # 使用 ssh-keygen 清理
    ssh-keygen -R "$TARGET"

    # 额外清理所有残留
    if [ -f "$KNOWN_HOSTS" ]; then
        grep -v "$TARGET" "$KNOWN_HOSTS" > "${KNOWN_HOSTS}.tmp"
        mv "${KNOWN_HOSTS}.tmp" "$KNOWN_HOSTS"
    fi

    echo "===> 完成，可重新 SSH 连接 $TARGET"
}

alias cleanssh='clean_ssh'

alias ll='ls -laF'

# [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /usr/share/nvm/init-nvm.sh
export PATH="$HOME/.local/bin:$PATH"