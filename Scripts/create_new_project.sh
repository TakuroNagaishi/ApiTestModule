#!/bin/bash

cd `dirname $0`

echo -n project name :
read NAME

cp -r ../Projects/TestTemplate/ ../Projects/$NAME

echo -e "\e[32mProject '$NAME' was created successfully.\e[m"
