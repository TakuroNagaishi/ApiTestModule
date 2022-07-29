#!/bin/bash

cd `dirname $0`

PROJECT_DIRECTORY=Projects/$1/

if [ ! -e $PROJECT_DIRECTORY ]; then
  echo "No such project. Please create test project."
  exit 0
fi

# Read settings
source $PROJECT_DIRECTORY/settings.txt

# Initialize response directory.
rm -r $PROJECT_DIRECTORY/Responses/
mkdir $PROJECT_DIRECTORY/Responses/

# Execute request files
for request in `ls $PROJECT_DIRECTORY/Requests/`;
  do
    RESPONSE_FILE=$PROJECT_DIRECTORY/Responses/$request

    case "$METHOD" in
      POST ) curl -s -X POST -H $HEADER -d @$PROJECT_DIRECTORY/Requests/$request $URL > $RESPONSE_FILE;;
      * ) echo "No such method: $METHOD" ;;
    esac
  done;

# Format response files as json
for response in `ls $PROJECT_DIRECTORY/Responses/`;
  do
    php Scripts/format_json.php $PROJECT_DIRECTORY/Responses/$response;
  done;
