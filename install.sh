#!/bin/bash
#Author: Harsha Lokavarapu

#Shell script to install hashDist, a python based software.
#Options: 
#         -j    =>  jenkins build  
#         -d <name of directory to install>   => specify a particular install directory 
#Flags
jf=1
pf=1
INSTALL_DIR="$HOME/local/hashDist"

for itr in $@ 
do
  if [ "-j" -eq $itr ]; then
    $jf=0
  fi
  if [ "-d" -eq $itr ]; then
    $pf=0
  fi
  if [ $pf ]; then
    INSTALL_DIR=$itr
    $pf=1
  fi
done
  
#ENVIRONMENT variables
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
