#!/bin/bash 

# Function to clone or pull github repository

backup_repo()
{
	repo_url=$1
	backup_dir=$2

  # extract the repository name from the URL

    repo_name=$(basename $repo_url .git) 

  # check if the repository is already exists or not 

   if [ -d "$backup_dir/$repo_name" ];
   then 

	   echo "the repository is already exists pulling latesst changes......"
	   cd "$backup_dir/$repo_name" && git pull
   else 
	   echo "the repository doesn't exists ...cloning it ...."
	  
	   git clone "$repo_url" "$backup_dir/$repo_name"
   fi 
}

# Function to create a backup for the cloned / pulled  repository
  
create_backup()
{
	repo_path=$1
	backup_location=$2
	timestamp=$(date +%Y%m%d%H%M%S)
	backup_name=$(basename $repo_path)
	tar -czf "$backup_location/$backup_name-$timestamp.tar.gz" -C "$(dirname $repo_path)" "$(basename $repo_path)"
	echo "The Backup is created at $backup_location/$backup_name-$timestamp.tar.gz"

}

# The main program 

echo "Enter A Github Repository URL To Backup "

read repo_url

# define the backup location 

backup_dir="./git_repos"
backup_location="./backups_repo"

# create directories if they do not exists

mkdir -p "$backup_dir"
mkdir -p "$backup_location"

# backup the repository 

backup_repo "$repo_url" "$backup_dir"

# create a compressed backup for the repository 

create_backup "$backup_dir/$(basename $repo_url .git)" "$backup_location"

echo "The Backup Process Is Completed"





# the mistakes that i have done and how i fixed it :
#  i faced a problem after the github url has been cloned or pulled . the backup repo was empty , after investigation 
#  i have found the following mistakes 
#   the mistake (create_backup "$backup_dir/*$basename $repo_url .git" "$backup_location")


# the fix  is in the  $() so bash executes it
# create_backup "$backup_dir/$(basename $repo_url .git)" "$backup_location"
#
#
# the mistake missing the folder to compress at the end
# tar -czf "$backup_location/$backup_name-$timestamp.tar.gz" -C "$repo_path"

# the fix tell tar what to compress after -C
# tar -czf "$backup_location/$backup_name-$timestamp.tar.gz" -C "$(dirname $repo_path)" "$(basename $repo_path)"
