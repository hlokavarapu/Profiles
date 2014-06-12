#!/bin/bash
#Author: Harsha Lokavarapu

#Downloading utility tool hit
if [ ! -d ~/.hashdist ]; 
then
  if [ ! -d hashdist ]; then
    git clone https://github.com/hashdist/hashdist.git 
  fi

  #adding to path
  ENV="export PATH=$PATH:$PWD/hashdist/bin"
  if [ -f ${HOME}/.bashrc ];
  then
    echo $ENV >> ~/.bash_rc
    source ~/.bash_rc
  else
    echo $ENV >> ~/.bash_profile
    source ~/.bash_profile
  fi

  $PWD/hashdist/bin/hit init-home
fi

if [ ! -d hashstack ];
then
  git clone https://github.com/hashdist/hashstack.git
fi
