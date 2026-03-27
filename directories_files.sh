
#!/bin/bash

# Task: we are trying to create 3 directpries and 2 files inside each directory using loops & conditionals.

# Get the Desktop path of the current user
desktop_path="$HOME/Desktop"

# Loop to create 3 directories
for i in {1..3}
do
    # Define the directory name
    dir_name="Directory_$i"
    dir_path="$desktop_path/$dir_name"

    # Check if the directory already exists
    if [ -d "$dir_path" ]; then      //-d checks if the given path exists and is a directory.
        echo "$dir_name already exists on the Desktop."
    else
        # Create the directory
        echo "Creating $dir_name..."
        mkdir "$dir_path"
    fi

    # Loop to create 2 files inside the directory
    for j in {1..2}
    do
        # Define the file name
        file_name="file_$j.txt"
        file_path="$dir_path/$file_name"

        # Check if the file already exists
        if [ -f "$file_path" ]; then      //-f checks if the given path exists and is a file.
            echo "$file_name already exists in $dir_name."
        else
            # Create the file
            echo "Creating $file_name inside $dir_name..."
            touch "$file_path"
        fi
    done
done

echo "Process complete: 3 directories and 2 files have been created on the Desktop."
