#!/bin/bash

LOCATION="restore.sh"

#Change to script directory
cd `dirname "$0"`

#Dump Header
echo '#/bin/bash' > "restore.sh"

#Dump homebrew installion
echo 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' >> "restore.sh"

#Dump update brew
echo 'brew update' >> "restore.sh"
echo 'brew upgrade' >> "restore.sh"

#Dump taps
brew tap | while read tap;
do
  echo "brew tap $tap" >> "restore.sh"
done

#Dump brew
brew list | while read item;
do
  echo "brew install $item" >> "restore.sh"
done

#Dump cask
brew cask list | while read item;
do
  echo "brew cask install $item" >> "restore.sh"
done

#Dump app store
find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |\sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##' > appstore.txt

#Dump applications
ls /Applications > applications.txt

#Dump zshrc
cp -r ~/.zshrc ./zsh/.

#Dump vim
cp -R ~/.vim_runtime/vimrcs/* ./vimrcs/.

#Cleanup
echo 'brew cleanup' >> $LOCATION
echo 'brew cask cleanup' >> $LOCATION

git add -A
git commit -m "Automatically commited"
git push

