#!/bin/bash
#Author: Harsha Lokavarapu

#Shell script to install hashDist, a python based software.

#ENVIRONMENT variables
INSTALL_DIR="$HOME/local"
ENV="export PATH=$PATH:$PWD/hashdist/bin"
  
#Install hit, a utility tool. 
if [ -z `which hit` ] || [ ! -d $HOME/.hashdist ]; then
  if [ -d $HOME/local ]; then
      mkdir $HOME/local
  fi
  git clone https://github.com/hashdist/hashdist.git $HOME/local/
  echo $ENV >> $HOME/.bash_profile
  . $HOME/.bash_profile
fi

#Initializing hashDist
if [ ! -d $HOME/.hashdist ]; 
then
  $HOME/bin/hit init-home
fi

#Downloading hashDist Profile Specifications
if [ ! -d hashstack ];
then
  git clone https://github.com/Vandemar/hashstack.git -b CIG hashstack
#  git clone https://github.com/hashdist/hashstack.git
fi
