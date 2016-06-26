# Manage multiple git, nodejs & bower directories

auto-repos is a group of aliases - originally designed as a zsh plugin - to help
you don't using repetitive commands across multiple directories.

It was originally made to help mitigate the pain of installing all the nodejs
dependencies for a large project - ~20 directories - with a lot of dependencies
between each other, so with just 2 commands all npm links and dependencies got
resolved.

## Aliases

### Runs in all sulfolders

    ara <command>                 # runs <command> in all directories
    
### Git 
Runs in all subfolders with a .git/config file

    arg <command>                # <command>
    argp                         # git pull
    argco <branch>               # git checkout to the specified branch
    
### Bower
Runs in subfolders with a bower.json file

    arb <command>                # <command>
    arbi                         # bower install
    arbu                         # bower update
    
### NodeJS
Runs in all subfolders with a packages.json file

    arn <command>                # <command>
    arni                         # npm install
    arnu                         # npm update
    arnla <match>                # grabs the list of package.json dependencies, 
                                 # and where it maches `match`, executes `npm link <the package name>`
    arnl github                  # same as `arnla` but only in current directory

## Example
For all nodejs subfolders, creates an npm link for each one of them, and link
them according to repositories matching "github" in both the name or url in
packages.json

    arn npm link
    arnla github
