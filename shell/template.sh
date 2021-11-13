#!/bin/bash

script_name=`basename "$0"`
work_dir=`pwd`
#echo "script_name: ${script_name}"
#echo "work_dir: ${work_dir}"
#echo "full path: ${work_dir}/${script_name}"
if [ $# != 1 ] ; then
    echo "USAGE: ./${script_name} {the_token}"
    echo "e.g.: ./${script_name} 'thetoken'"
    exit;
fi
the_token=$1
if [ -z "${the_token}" ]; then
  the_token="thetoken"
fi
cookie=${the_token}
echo "cookie: ${cookie}"
