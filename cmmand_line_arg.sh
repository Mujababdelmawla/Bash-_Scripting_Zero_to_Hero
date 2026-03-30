#!/bin/bash 

# define a global variable 

my_name="MUJAB"

# define a function using local variable and command-line arrgument 

my_function()
{

	# define a local variable inside the function
	
	age=$1 # the command-line arrgument will be passed to the function

	echo "my age is : $age"
}

# using parameter substitution to set default value for age variable if not passed during the execution 

age_input=${1:-26}  # if no command-line arrgument is provided ,the default age will be 26

# print the global variable 

echo "my name is : $my_name"

# call the function through the comman-line arrgument 

my_function "$age_input"
