#!/bin/bash

function help()
{
    echo "";
    echo "sh kill_app.sh {app_name}"
    echo ;
}

if [ -n "$1" ];then
    APP_NAME=$1;
else
    help;
    exit;
fi

echo "ps aux | grep ${APP_NAME} | grep -v grep | awk '{print $2}'| xargs kill -9"
ps aux | grep ${APP_NAME} | grep -v grep | awk '{print $2}'| xargs kill -9
if [ $? -eq 0 ];then
    echo "kill ${APP_NAME} succeed."
else
    echo "kill ${APP_NAME} failed."
    exit;
fi
