#!/bin/bash
#Author: Harsha Lokavarapu

#Downloading utility tool hit
if [ ! -d hashdist ]; then
git clone https://github.com/hashdist/hashdist.git 
fi

#adding to path
  echo "export PATH=$PATH:$PWD/hashdist/bin" >> ~/.bash_profile
  source ~/.bash_profile

pathToHit="$PWD/hashdist/bin"

if [ ! -d ~/.hashdist ];
then 
  $pathToHit/hit init-home
fi

if [ ! -d hashstack ];
then
  git clone https://github.com/hashdist/hashstack.git
fi
