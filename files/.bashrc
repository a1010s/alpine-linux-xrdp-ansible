parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PAGER=less
export MANPAGER=less
export PS1="\[\e[32m\]\u \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

source <(kubectl completion bash)
complete -o default -F __start_kubectl k
source <(helm completion bash)


# Define a function named gitacp (Git Add, Commit, and Push)
gitacp() {
    git add .
    git commit -m "auto-commit"
    git push origin master
}
alias k="kubectl"
alias vi="vim"
