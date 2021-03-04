# Setting up a generic dev machine
```
ansible-playbook dev.yml --extra-vars "{\"git_user_email\": \"dan.bernardic@gmail.com\", \"git_user_name\": \"Dan Bernardic\"}"
```

At the time of this writing, this:
- installs aptitude package manager
- installs the build-essential set of packages
- installs ag-silversearcher
- creates a code directory at ~/code
- generates a passphrase-less SSH key
- sets up vim as git editor, and sets up the git email and name used for commits based on the command-line params
- sets up vim the way I like to use it
- sets up oh-my-zsh
