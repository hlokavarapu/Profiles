#!/bin/bash
#Author: Harsha Lokavarapu

#Shell script to install hashDist, a python based software.
#Options: 
#         -j    =>  jenkins build  
#         -d <name of directory to install>   => specify a particular install directory 
#         -h   => help command, dumps flags
#Flags
jf=1
pf=1
INSTALL_DIR="$HOME/local/hashDist"
BUILD_DIR="$HOME/hashBuild"
for itr in $@ 
do
  if [ "-j" = "$itr" ]; then
    jf=0
  fi
  if [ "-d" = "$itr" ]; then
    pf=0
    continue
  fi
  if [ $pf -eq 0 ]; then
    INSTALL_DIR=$itr
    echo "Install Dir has been set to $INSTALL_DIR"
    pf=1
  fi
  if [ "-h" = "$itr" ]; then
    echo "Options:\n" 
    echo "\t-j => for  jenkins build\n"  
    echo "\t-d <name of directory to install>   => specify a particular install directory\n" 
    echo "\t-h   => help command, dumps flags\n"
    exit
  fi
done
  
#ENVIRONMENT variables
ENV="export PATH=\"\$PATH:$INSTALL_DIR/bin\""
  
#Install hit, a utility tool. 
if [ -z `which hit` ]; then
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
if [ ! -d hashstack ] && [ $jf -ne 0 ];
then
  git clone https://github.com/Vandemar/hashstack.git -b CIG hashstack
#  git clone https://github.com/hashdist/hashstack.git
fi

#For jenkins
if [ ! -d $BUILD_DIR ] && [ $jf -eq 0 ]; then
  mkdir -p $BUILD_DIR
fi
if [ ! -d $BUILD_DIR/hashstack ] && [ $jf -eq 0 ]; then 
  git clone https://github.com/Vandemar/hashstack.git -b CIG $BUILD_DIR/hashstack
fi

