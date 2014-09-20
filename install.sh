#!/usr/bin/env bash

_base_dir=$( cd $( dirname $0 ); pwd )
_user_dir=./tmp #${HOME}
_link_all=0
_dirs=$( cd ${_base_dir}; ls -d */ )
_ignore_list=

#_bash_links=$( find ${_base_dir}/bash -name *.lnk | xargs )
#[ $? -eq 0 ] || echo "Could not read files."
#
for _dir in ${_dirs}; do
    declare _${_dir%%/}_dir="${_base_dir}/${_dir%%/}"
    _link="${_link} ${_dir%%/}"
done

while getopts i: option
do
    case "${option}"
    in
        i) _ignore_list="${OPTARG}" ;;
    esac
done

function _do_link {
    for file in ${_links}; do
        echo ${file}
    done
}

function _install {
    echo "install"
}

function _link {
    echo "link file one to file two"
}

function _set_git_email {
    sed -i e 's/\[user\.email\]/$1/g'
}

function _help() {
    echo "Help Goes Here"
}

if [ $1 ]; then
    case "$1" in
        install)
            _install
        ;;
        *)
            _help
        ;;
    esac
elif [ _link_all == 1 ]; then
   _do_link
else
    _help
fi