#!/bin/sh

# 遍历当前目录下的所有文件夹(每个文件夹是一个仓库)，进行代码拉取
#find . -mindepth 1 -maxdepth 1 -type d -exec echo -n {}" " \; -exec git -C {} pull \;

# 遍历各子目录下的所有文件夹(每个文件夹是一个仓库)，进行代码拉取
find . -mindepth 2 -maxdepth 2 -type d ! -path *.git* -exec echo -n {}" " \; -exec git -C {} pull \;
