#!/bin/bash

if [ -d hashdist ]; then
git clone https://github.com/hashdist/hashdist.git 
fi

cd hashdist

#adding to path
if [ -f ~/.bashrc ];
then 
  echo "export PATH=$PWD/bin:\$PATH" >> ~/.bashrc
  source ~/.bashrc
else
  export PATH=$PWD/bin:$PATH
fi

pathToHit="`which hit`"

if [ -f $pathToHit ];
then 
  hit init-home
fi

if [ -d hashstack ];
then
  git clone https://github.com/hashdist/hashstack.git
fi
