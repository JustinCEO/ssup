# ssup - upload screenshot

The purpose of this software is to enable efficient screen capture and upload of screenshots to your own server.

It was made for use on macOS but other people may find it useful.

It assumes you have an SSH key set up for logging into your web server.

## Credit

The initial version of this software was made by Josh Jordan. Elliot Temple improved it as you can see [here](https://groups.google.com/d/msg/fallible-ideas/ub77-mJZTjA/8tlc0qa9BAAJ), including the addition of the ruby complementary ruby script. These two guys solved the hard parts. I have made changes to get things working on my system, clean up the code some, and reorganization the program according to my own preferences.

## Initial configuration

Before you use ssup for the first time, fill in the info in ssup to configure the
upload command and the URL. You want to set the correct info for the following variables:

- SSH_USER
- SERVER_IP
- SERVER_PORT_NUMBER
- URL
- FINAL_PATH

You can also change this variable if you need to:

SSH_KEY_PATH

And you can change FORMAT to your preference of image format. I've set it to jpg by default because png was buggy.

## Directions

1. Take a screenshot with command+control+shift+4, so the screenshot is in the
   clipboard.

2. Run ssup to upload the image in the clipboard.

3. Wait for ssup to finish. (It says "image uploaded" with text-to-speech
   when it's done.)

4. The URL of the uploaded image is in your clipboard.

## Use

You'll need to set up a shortcut key to run this script to get the full benefit. You can try stuff like Automator, Keyboard Maestro, or the ActionShortcuts app https://hazeover.com/actionshortcuts.html

## Prerequisites

- [pngpaste](https://github.com/jcsalterego/pngpaste)
