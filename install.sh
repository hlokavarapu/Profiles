#!/bin/bash
#Author: Harsha Lokavarapu

#Downloading utility tool hit

flag=0
if [ ! -d ~/.hashdist ]; 
then
  if [ ! -d hashdist ]; then
    git clone https://github.com/hashdist/hashdist.git 
  fi
  
  flag=1
fi

#adding to path
ENV="export PATH=$PATH:$PWD/hashdist/bin"
if [ -z `which hit` ]; 
then 
  if [ -f ${HOME}/.bashrc ];
  then
    echo $ENV >> ~/.bashrc
    . ~/.bashrc
  else
    echo $ENV >> ~/.bash_profile
    . ~/.bash_profile
  fi
fi

if [ $flag -eq 1 ]; 
then
  $PWD/hashdist/bin/hit init-home
fi

if [ ! -d hashstack ];
then
  git clone https://github.com/Vandemar/hashstack.git -b CIG hashstack
#  git clone https://github.com/hashdist/hashstack.git
fi
