#!/bin/zsh


### Check Config and create symbolic link


FOLDER="Dotfiles"
echo "Search if folder doltfile exist in $HOME ..."
echo "$HOME/GIT/$FOLDER"


if [[ -d $HOME/GIT/$FOLDER ]]
then
        echo "folder exist"
else
        echo "Clone the repository"
        git clone git@gitlab.com:acexiis/dotfiles.git "$HOME/Dotfiles"
fi


echo "Create symbolic link and delete real file if exist"

files=(
    zshrc
    zsh
    muttrc
    mutt
    vimrc
    vim
    tmux.conf
)

for i in ${files[*]}
do
    if [[ -f $HOME/.$i ]] || [[ -h $HOME/.$i ]]
    then
        rm -rf $HOME/.$i
    fi

    echo "Create link : ln -s $(/usr/bin/find $HOME/$FOLDER -maxdepth 3 -name $i) $HOME/.$i"
    ln -s $(/usr/bin/find $HOME/GIT/$FOLDER -maxdepth 3 -name $i) $HOME/.$i
done
