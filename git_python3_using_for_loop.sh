#!/bin/bash

tools=("git" , "python3")

for tool in "${tools[@]}"
do

# check and insatll git

if command -v $tool &> /dev/null;
then
        echo "$tool is already installed ."
else
        echo "$tool is not insatlled ....installing $tool"

# check if the system is macos

if [[ "$(uname)" == "Darwin" ]];
then
        brew insatll $tool


elif [[ "$(uname)" == "Linux" ]];
then
        sudo apt update
        sudo apt install -y $tool

else
        echo "unsupported os .. can't install $tool"

fi

# verify if git installed successfully

if command -v $tool &> /dev/null;
then
        echo "$tool is successfully installed "

else
        echo "failed to insatll $tool , please check your system "

fi
fi
done
