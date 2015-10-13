_arSavePwd() {
    _ARPWD=`pwd`
}

_arRollBackPwd() {
    cd $_ARPWD;
}

_arAnyAction() {
    echo "Folder" `pwd` "..."
    echo "  ^ " $@
    echo ""
    $@
    echo ""
    echo ""
}

_arGitAction() {
    echo "Folder" `pwd` "..."
    if [ -f ".git/config" ]; then
        echo "  ^ " $@
        echo ""
        $@
    else
        echo "  ^ ignoring"
    fi
    echo ""
    echo ""
}

_arNodeAction() {
    echo "Folder" `pwd` "..."
    if [ -f "package.json" ]; then
        echo "  ^ " $@
        echo ""
        $@
    else
        echo "  ^ ignoring"
    fi
    echo ""
    echo ""
}

_arNi() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arNodeAction npm install; done;
    _arRollBackPwd
}

_arNu() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arNodeAction npm update; done;
    _arRollBackPwd
}

_arGp() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arGitAction git pull; done;
    _arRollBackPwd
}

_arGco() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arGitAction git checkout $@; done;
    _arRollBackPwd
}

_arA() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arAnyAction $@; done;
    _arRollBackPwd
}

_arN() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arNodeAction $@; done;
    _arRollBackPwd
}

_arG() {
    _arSavePwd
    find . -maxdepth 1 -type d | while read -r line; do cd "$_ARPWD/$line" && _arGitAction $@; done;
    _arRollBackPwd
}

alias arni=_arNi
alias arnu=_arNu
alias argp=_arGp
alias argco=_arGco

alias ara=_arA
alias arn=_arN
alias arg=_arG
