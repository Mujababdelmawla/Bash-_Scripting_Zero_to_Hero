#!/bin/bash

# Define an array of tools to check and insatll

tools=("git" "bash" "python3")

# function to install the tool 

install_tool()
{
	local tool=$1

	echo "$tool is not installed ..installing $tool...."

	
	# check the operating system if it is macos or linux
	
	if [[ "$(uname)" == "Darwin" ]];
	then 
		brew install $tool 
	elif [[ "$(uname)" == "Linux" ]];
	then 
		sudo apt update 
		sudo apt install -y $tool

	else 
		echo "unsupported os , can't install $tool"
		
	fi 

	# verify the installation 
	
	if command -v &> /dev/null;
	then 
		echo "$tool has been installled successfully ."

	else 
		echo "failed to install $tool please check your system "

	fi 
}

# loops through each tool in the tool array 

for tool in ${tools[@]};
do 
	if command -v &> /dev/null ;
	then 
		echo "$tool is already installed "
	else 
		# call the function to install the tool 

		install_tool $tool
	fi 
done 

echo "the installation check has been completed successfully......"


