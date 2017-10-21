#!/usr/bin/env bash

# Set an environment variable for webcam-capture directory path
WEBCAM_CAPTURE_PATH=$HOME/Pictures/webcam-capture

# Set an environment variable for photo image file name format
FILENAME=webcam-capture-$(date +%Y%m%d%H%M)

# `os_detect` exports the `PLATFORM` variable according to the current OS
os_detect() {
  case "$OSTYPE" in
    *darwin*)  PLATFORM="macos"   ;;
    *linux*)   PLATFORM="linux"   ;;
  esac
}

# Detact OS type
os_detect

# Take a photo with webcam, depending on your OS type
if [[ "$PLATFORM" == "macos" ]]; then
  if [[ -x /usr/local/bin/imagesnap ]]; then
    if [[ ! -d $HOME/Pictures/webcam-capture ]]; then
      mkdir -p $HOME/Pictures/webcam-capture
      echo "$HOME/Pictures/webcam-capture directory has been created!"
    fi
    /usr/local/bin/imagesnap $HOME/Pictures/webcam-capture/$FILENAME.jpg
  else
    echo "Oops, you do not have \`imagesnap\` installed on your system."
    echo "Run \`brew install imagesnap\` to install it OR install it via the preferred installation of your choice."
    exit 1
  fi
elif [[ "$PLATFORM" == "linux" ]]; then
  if [[ -x /usr/bin/fswebcam ]]; then
    if [[ ! -d $HOME/Pictures/webcam-capture ]]; then
      mkdir -p $HOME/Pictures/webcam-capture
      echo "$HOME/Pictures/webcam-capture directory has been created!"
    fi
    /usr/bin/fswebcam -r 1280x1024 --line-colour '#FF000000' --banner-colour '#FF000000' -F 10 $HOME/Pictures/webcam-capture/$FILENAME.jpg
  else
    echo "Oops, you do not have \`fswebcam\` installed on your system."
    echo "Run \`sudo apt-get install fswebcam\` to install it OR install it via the preferred installation of your choice."
    exit 1
  fi
else
  echo "Error! Unsupported OS :-("
  echo "Re-try with macOS or Linux."
fi
