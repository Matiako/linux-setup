#!/bin/bash
INTELLIJ_DIR=$HOME/Apps/intellij
mkdir -p $INTELLIJ_DIR
cd $INTELLIJ_DIR
curl --progress-bar -L -O https://download.jetbrains.com/idea/ideaIU-2020.1.4.tar.gz
tar -xzvf ideaIU-2020.1.4.tar.gz
rm ideaIU-2020.1.4.tar.gz
chmod -R a+rwx idea-IU-201.8743.12

echo '#!/usr/bin/env xdg-open' >> $HOME/Desktop/Intellij.desktop
echo '[Desktop Entry]' >> $HOME/Desktop/Intellij.desktop
echo 'Version=1.0' >> $HOME/Desktop/Intellij.desktop
echo 'Type=Application' >> $HOME/Desktop/Intellij.desktop
echo 'Terminal=false' >> $HOME/Desktop/Intellij.desktop
echo "Icon=$INTELLIJ_DIR/idea-IU-201.8743.12/bin/idea.svg" >> $HOME/Desktop/Intellij.desktop
echo "Icon[en_US]=$INTELLIJ_DIR/idea-IU-201.8743.12/bin/idea.svg" >> $HOME/Desktop/Intellij.desktop
echo 'Name[en_US]=Intellij' >> $HOME/Desktop/Intellij.desktop
echo "Exec=$INTELLIJ_DIR/idea-IU-201.8743.12/bin/idea.sh" >> $HOME/Desktop/Intellij.desktop
echo 'Name=Intellij' >> $HOME/Desktop/Intellij.desktop

chmod a+rwx $HOME/Desktop/Intellij.desktop
