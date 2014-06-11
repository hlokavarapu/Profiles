#!/bin/bash
#Author: Harsha Lokavarapu

#Downloading utility tool hit
if [ ! -d ~/.hashdist ]; 
then
  if [ ! -d hashdist ]; then
    git clone https://github.com/hashdist/hashdist.git 
  fi

  #adding to path
  echo "export PATH=$PATH:$PWD/hashdist/bin" >> ~/.bash_profile
  source ~/.bash_profile

  $PWD/hashdist/bin/hit init-home
fi

if [ ! -d hashstack ];
then
  git clone https://github.com/hashdist/hashstack.git
fi
