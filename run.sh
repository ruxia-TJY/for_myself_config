#!/bin/bash
set -e

BASHRC="$HOME/.bashrc"

add_alias() {
    local alias_cmd="$1"
    grep -qxF "$alias_cmd" "$BASHRC" || echo "$alias_cmd" >> "$BASHRC"
}

add_clone(){
    local name="$1"
    local url="$2"
    
    echo "Try to install $1"

    if [ -d $1 ];then
        echo "Delete $1" 
        sudo rm -rf $1
    fi
    
    git clone $2
    cd $1
    chmod a+x make.sh
    ./make.sh
    sudo cp ./bin/* /usr/local/bin
    cd ../
}


echo "Updating apt index...."
sudo apt update

echo "Installing build-essential..."
sudo apt install build-essential -y

sudo apt install bat git exa duf -y


echo "Add alias"
add_alias "alias q=exit"
add_alias "alias cat=batcat"
add_alias "alias py=python3"
add_alias "alias exa=l"

source "$BASHRC"

add_clone ct https://gitee.com/ruxia-tjy/ct 
add_clone envp https://github.com/ruxia-tjy/envp

echo "Done."