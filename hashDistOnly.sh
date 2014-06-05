#!/bin/bash

git clone https://github.com/hashdist/hashdist.git 
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

git clone https://github.com/hashdist/hashstack.git
