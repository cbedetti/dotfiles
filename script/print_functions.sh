
info () {
    # Blue
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
    # Question
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
    # Green
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    # Red
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}
