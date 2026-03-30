#!/bin/bash 


# promt the user for an email address

read -p "Enter Your Email" email 

# regular expression for validating the email 

regex="^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]{2,}$"

# check if the entered email matches the regular expression

if [[ $email =~ $regex ]]; 
then 
	echo "the email you have entered is vaild one"
else 
	echo "the email you have entered is invalid please try another one..."
fi




# regular expressoin is an advanced concept of grep 
# it is for validating or extracting a specific information form the input
# usually used to extract an infromation from emails and ip addresses 
#
#
# username@domain.com 
# Regex: ^\[a-zA-Z0-9._%+-\]+@\[a-zA-Z0-9.-\]+.\[a-zA-Z\]{2,}$  
#
#
# ip address
# Regex: ^(\[0-9\]{1,3}.){3}\[0-9\]{1,3}$
