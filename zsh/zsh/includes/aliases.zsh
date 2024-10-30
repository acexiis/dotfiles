# EZA
alias ls="eza --color=always --long --git"
# ZOXIDE

alias cd="z"
eval "$(zoxide init zsh)"

# BAT
alias cat="bat --style=plain --paging=never"

# Brew
alias bu="brew update"
alias bU="brew update && brew upgrade"

# Terraform aliases
alias trp="terraform plan"
alias tra="terraform apply"
alias trd="terraform destroy"


# Pass aliases
alias cpsys=" pass Northeastern/sysaccount| tr -d '\n' | pbcopy"
alias cpsat=" pass Northeastern/salellite|pbcopy"


# Example aliases
#alias ls="lsd"
#alias lsa="lsd -la"
#alias la="ls -lah"
alias e="exit"
alias ldapvir="ldapvi -h ldapr"
alias ldapvis="ldapvi --ldapsearch -h ldapr"
alias mtr="sudo mtr"
alias partage="cd ~/GIT/Partage/apipartage/ && workon partage"


### nmond
alias nmon="make -C GIT/nmond/nmond/"
alias sysaccount="cat ~/.sysaccount.gpg | gpg -d 2>/dev/null"
### MUTT ###
alias m=neomutt
# VIM
alias v=nvim
alias vim=nvim
alias vw="vim ~/vimwiki/index.wiki"
alias vimwiki="vim ~/vimwiki/index.wiki"

###GIT###
alias gts="git status"
alias gtp="git pull"
alias gtd="git diff"
alias gtps="git push"
alias gta="git add"
alias gtm="git commit -m"
alias gtc="git checkout"

# alias zshconfig="mate ~/.zshrc"
