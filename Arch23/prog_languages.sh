#!/bin/bash

read -r -d '' message << EOM
===================:: Programming Languages :: =====================
Which language wish to install? 

        Rust                [1]
        Golang              [2]
        Python              [3]
        Rust + Golang       [4]
        Rust + Python       [5]
        Python + Golang     [6]
        All                 [7]
        None                [8]
EOM

echo "$message"
read -p  "Enter 1|2|3|4|5|6|7|8: " ans


python_in="sudo pacman -S --noconfirm python"
go_in="sudo pacman -S --noconfirm golang ; mkdir -p $HOME/go ;" \
      "echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc && echo 'export GOPATH=$HOME/go' >> $HOME/.zshrc ;" \
      "source $HOME/.bashrc && source $HOME/.zshrc"
rust_in="s pacman -S --noconfirm rust"


while :
do
    case $ans in
        1) eval "$rust_in" ; exit ;;
        2) eval "$go_in" ; exit ;;
        3) eval "$python_in" ; exit ;;
        4) eval "$rust_in" && eval "$go_in" ; exit ;;
        5) eval "$rust_in" && eval "$python_in" ; exit ;;
        6) eval "$python_in" && eval "$go_in" ; exit ;;
        7) eval "$rust_in" && eval "$python_in" && eval "$go_in" ; exit ;;
        8) exit ;;
        *) echo "Wrong ans! Enter Correctly!" ;;
    esac
done




