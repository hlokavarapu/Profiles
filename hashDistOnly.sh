#!/bin/bash
#Author: Harsha Lokavarapu

#Downloading utility tool hit
if [ ! -d hashdist ]; then
git clone https://github.com/hashdist/hashdist.git 
fi

#adding to path
if [ -f ~/.bashrc ];
then 
  echo "export PATH=$PWD/hashdist/bin:\$PATH" >> ~/.bashrc
  source ~/.bashrc
else
  export PATH=$PWD/hashdist/bin:$PATH
fi

pathToHit="$PWD/hashdist/bin"

if [ -d ~/.hashdist ];
then 
  $pathToHit/hit init-home
fi

if [ ! -d hashstack ];
then
  git clone https://github.com/hashdist/hashstack.git
fi
