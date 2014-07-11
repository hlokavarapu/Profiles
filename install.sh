#!/bin/bash
#Author: Harsha Lokavarapu

#Shell script to install hashDist, a python based software.

#ENVIRONMENT variables
if [ ! -z $1 ]; then
  INSTALL_DIR=$1
else
  INSTALL_DIR="$HOME/local/hashDist"
fi

ENV="export PATH=\"\$PATH:$INSTALL_DIR/bin\""
  
#Install hit, a utility tool. 
if [ ! -z `which hit` ]; then
  if [ ! -d $INSTALL_DIR ]; then
      mkdir -p $INSTALL_DIR
  fi
  git clone https://github.com/hashdist/hashdist.git $INSTALL_DIR
  echo $ENV >> $HOME/.bash_profile
  . $HOME/.bash_profile
fi

#Initializing hashDist
if [ ! -d $HOME/.hashdist ]; 
then
  hit init-home
fi

#Downloading hashDist Profile Specifications
if [ ! -d hashstack ];
then
  git clone https://github.com/Vandemar/hashstack.git -b CIG hashstack
#  git clone https://github.com/hashdist/hashstack.git
fi
