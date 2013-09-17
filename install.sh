#!/bin/bash
# -*- coding: utf-8 -*-

config_file=~/temp/vimrc
install_dir=~/temp/vim.d
plugins_dir=plugins
type_vim="vim"
type_zip="zip"

str_done=" ok"

if [ ! -e $plugins_dir ]
then
    echo "No plugins directory."
    exit 1
fi

install_vim_type_plugin ()
{
    cp $1 ${install_dir_plugin}
}

install_zip_type_plugin ()
{
    unzip -o -q $1 -d $install_dir
}

# install plugins

# checking install directories
if [ ! -e $install_dir ]
then
    echo "Creating install directory: $install_dir"
    mkdir $install_dir
elif [ ! -d $install_dir ]
then
    echo "Install directory $install_dir is not a directory."
    exit 1
fi

install_dir_plugin=${install_dir}/plugin
install_dir_doc=${install_dir}/doc

if [ ! -e $install_dir_plugin ]
then
    mkdir $install_dir_plugin
fi

if [ ! -e $install_dir_doc ]
then
    mkdir $install_dir_doc
fi

cd $plugins_dir
for plugin_file in $(ls) 
do
    plugin_type=$(echo $plugin_file | awk -F . '{print $NF}')
    plugin_name=$(basename $plugin_file .$plugin_type)
    echo -n "Installing $plugin_name: type $plugin_type .."
    
    if [ $plugin_type = $type_vim ]
    then
        install_vim_type_plugin $plugin_file
        echo $str_done
    elif [ $plugin_type = $type_zip ]
    then
        install_zip_type_plugin $plugin_file
        echo $str_done
    else
        echo "skip"
    fi
done
cd ..  # change dir back

# install configuration file
echo -n "Instaling configuration file .."
cp -f vimrc $config_file
echo $str_done
