# MIT license.
# gihub: @joseconstela

# Stores current directory for later use
_arSavePwd() {
    _ARPWD=`pwd`
}

# cds into previous directory
_arRollBackPwd() {
    cd $_ARPWD;
}

# Executes the arguments in the current directory
_arAnyAction() {
    echo "Folder" `pwd` "..."
    echo "  ^ " $@
    $@
}

# Executes the arguments in the current directory - if .git/config file exists
_arGitAction() {
    echo "Folder" `pwd` "..."
    if [ -f ".git/config" ]; then
        echo "  ^ " $@
        $@
    else
        echo "  ^ ignoring"
    fi
}

# Executes the arguments in the current directory - if package.json file exists
_arNodeAction() {
    echo "Folder" `pwd` "..."
    if [ -f "package.json" ]; then
        echo "  ^ " $@
        $@
    else
        echo "  ^ ignoring"
    fi
}

# Executes the arguments in the current directory - if bower.json file exists
_arBowerAction() {
    echo "Folder" `pwd` "..."
    if [ -f "bower.json" ]; then
        echo "  ^ " $@
        $@
    else
        echo "  ^ ignoring"
    fi
}

# Loops subfolders and executues parameters in all subfolders
_arA() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arAnyAction $@; done;
    _arRollBackPwd
}

# Loops subfolders and executues parameters in git subfolders
_arG() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arGitAction $@; done;
    _arRollBackPwd
}

# Loops subfolders and executues git pull in git subfolders
_arGp() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arGitAction git pull; done;
    _arRollBackPwd
}

# Loops subfolders and executues git checkout in git subfolders
_arGco() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arGitAction git checkout $@; done;
    _arRollBackPwd
}

# Loops subfolders and executues parameters in bower subfolders
_arB() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arBowerAction $@; done;
    _arRollBackPwd
}

# Loops subfolders and executues bower install in bower subfolders
_arBi() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arBowerAction bower install; done;
    _arRollBackPwd
}

# Loops subfolders and executues bower update in bower subfolders
_arBu() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arBowerAction bower update; done;
    _arRollBackPwd
}

# `arn <command>` runs `<command>`
_arN() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arNodeAction $@; done;
    _arRollBackPwd
}

# `arni` runs `npm install`
_arNi() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arNodeAction npm install; done;
    _arRollBackPwd
}

# `arnu` runs `npm update`
_arNu() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arNodeAction npm update; done;
    _arRollBackPwd
}

# `arnla <match>` grabs the list of package.json dependencies, and where 
# it maches `match`, executes `npm link <the package name>`
_arnla() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arnl $@; done;
    _arRollBackPwd
}

# same as `arnla` but only in current directory
_arnl() {
    echo "Folder" `pwd` "..."

    if [ -f "package.json" ]; then
        echo "  ^ npm link packages files matching " $@
        _armatchingPackages=($(cat package.json | grep "$@" | cut -d \" -f2))
        for i in "${_armatchingPackages[@]}"
        do
            :
           npm link $i
        done
    else
        echo "  ^ ignoring"
    fi
}

## Common commands. Runs in all sulfolders.
alias ara=_arA              # `ara <command>` runs `<command>`

## Git. Runs in subfolders with a .git/config file
alias arg=_arG              # `arg <command>` runs `<command>`
alias argp=_arGp            # `argp` runs `git pull`
alias argco=_arGco          # `argco <branch>` runs `git checkout` to 
                            # the specified branch

## Bower. Runs in subfolders with a bower.json file
alias arb=_arB              # `arb <command>` runs `<command>`
alias arbi=_arBi            # `arbi` runs `bower install`
alias arbu=_arBu            # `arbu` runs `bower update`

## NodeJS. Runs in subfolders with a packages.json file
alias arn=_arN              # `arn <command>` runs `<command>`
alias arni=_arNi            # `arni` runs `npm install`
alias arnu=_arNu            # `arnu` runs `npm update`
alias arnla=_arnla          # `arnla <match>` grabs the list of package.json 
                            # dependencies, and where it maches `match`,
                            # executes `npm link <the package name>`
alias arnl=_arnl            # same as `arnla` but only in current directory
