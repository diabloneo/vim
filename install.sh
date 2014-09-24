#!/bin/bash
# -*- coding: utf-8 -*-

config_file=~/.vimrc
install_dir=~/.vim
plugins_dir=plugins
type_vim="vim"
type_zip="zip"
str_done=" ok"
timestamp=$(date +%Y%m%d%H%M%S)

install_vim_type_plugin () {
    cp $1 ${install_dir_plugin}
}

install_zip_type_plugin () {
    unzip -o -q $1 -d $install_dir
}

install_vimrc_file () {
    echo -n "Installing configuration file .."
    cp -f vimrc $config_file
    echo $str_done
}

delete_backup_file() {
    local filepath=${1}
    echo -n "Do you want to delete backup file? (yes/no)"
    read delete_decision
    if [ $delete_decision = "yes" ]; then
        rm -f ${filepath}
        echo "Backup file ${filepath} was deleted."
    else
        echo "Your previous configs was packed in ${filepath}"
    fi
}

if [ ! -e $plugins_dir ]; then
    echo "No plugins directory."
    exit 1
fi

# install procedure starting here

# if run this script with vimrc as first argument, only install
# ~/.vimrc file
if [ $# -ge 1 ]; then
    if [ $1 = "vimrc" ]; then
        backup_vimrc=~/vimrc_${timestamp}
        cp ${config_file} ${backup_vimrc}
        install_vimrc_file
        delete_backup_file ${backup_vimrc}
        exit 0
    fi
fi

# backup and delete .vimrc and .vim/

# backup

backup_file=~/vim_config_${timestamp}.tar.gz
tar -czf $backup_file $config_file $install_dir
echo "Backup current config file and plugins to ${backup_file}"

# delete
rm -rf $install_dir
rm -f $config_file
echo "Current config file and plugins are deleted."

# install plugins

# create install dir
install_dir_plugin=${install_dir}/plugin
install_dir_doc=${install_dir}/doc
install_dir_bundle=${install_dir}/bundle

mkdir $install_dir
echo "Creating dir ${install_dir}."
mkdir $install_dir_plugin
echo "Creating dir ${install_dir_plugin}."
mkdir $install_dir_doc
echo "Creating dir ${install_dir_doc}."
mkdir $install_dir_bundle
echo "Creating dir ${install_dir_bundle}."

cd $plugins_dir
for plugin_file in $(ls); do
    plugin_type=$(echo $plugin_file | awk -F . '{print $NF}')
    plugin_name=$(basename $plugin_file .$plugin_type)
    echo -n "Installing $plugin_name: type $plugin_type .."
    
    if [ $plugin_type = $type_vim ]; then
        install_vim_type_plugin $plugin_file
        echo $str_done
    elif [ $plugin_type = $type_zip ]; then
        install_zip_type_plugin $plugin_file
        echo $str_done
    else
        echo "skip"
    fi
done
cd ..  # change dir back

# install vundle plugin
git clone https://github.com/gmarik/vundle.git ${install_dir}/bundle/vundle

# install configuration file
install_vimrc_file

# startup VIM to install bundles and quit
vim +BundleInstall "+helptags ${install_dir_doc}" +qall

delete_backup_file ${backup_file}
