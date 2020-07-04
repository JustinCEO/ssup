#!/bin/bash

# ssup - upload screenshots to your own webserver and get a URL in your clipboard. how handy!
# You'll need to set up a shortcut key to run this script to get the full benefit. You can try stuff like Automator, Keyboard Maestro, or these guys https://hazeover.com/actionshortcuts.html

# command to run to install some stuff you may need:
# brew install pngpaste imagemagick

set -x # Show commands as they are run.
set -e # Exit on error.


# make sure the ruby script half-image-dimensions.rb is in the same directory as the bash script so everything works correctly!
LOCAL_SCRIPT_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"

# Fill these next variables with your information.
SSH_USER="user"
SERVER_IP="your_ip"
SERVER_PORT_NUMBER="your_port_number"

# the script presumes you have an SSH key set up for the server and account you're logging into.  you can specify the path here if yours is different.
SSH_KEY_PATH="~/.ssh/id_rsa"

# despite the name, pngpaste supports png, gif, jpg, tiff. select the output format below by setting the variable. note that png had visual quality issues for me and this appears to be a known bug.
FORMAT="jpg"

# Generates random file name for image.
IMAGE_NAME=$(head -c 40 /dev/urandom | base64 | perl -pe 's~\W~~g' | head -c 15)

TEMP_FILE="/tmp/${IMAGE_NAME}.${FORMAT}"
pngpaste "$TEMP_FILE"

DIMENSIONS=$(ruby "${LOCAL_SCRIPT_DIRECTORY}"/half-image-dimensions.rb $TEMP_FILE)

FILE_NAME="${IMAGE_NAME}-${DIMENSIONS}.${FORMAT}"


#Put the URL, including the folder, where the image files will be stored on the web here, but leave ${FILE_NAME} alone
URL="http://yoursite.com/img/${FILE_NAME}"
#Put the full path of where the files will be located on your server here
FINAL_PATH="/var/www/html/yoursite.com/img/"



if scp -i ${SSH_KEY_PATH} -P ${SERVER_PORT_NUMBER} "$TEMP_FILE" "${SSH_USER}@${SERVER_IP}:${FINAL_PATH}${FILE_NAME}"
  then ssh "${SSH_USER}@${SERVER_IP}" -p ${SERVER_PORT_NUMBER} chmod 644 ${FINAL_PATH}${FILE_NAME}
else
  say "oh my god the file name was a duplicate"
  exit 1
fi

#You can optionally add a ![] $URL below for easily displaying images on curi's blog comments. I've left a version of that commented out.
echo -n "$URL" | pbcopy
#echo -n "![]$URL" | pbcopy

say "image uploaded"
