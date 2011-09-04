#!/bin/ksh

if [ $# = 0 ] ; then
  echo usage : $0 directory
  exit 0
fi

dir=$1
cd $dir

for d in * ; do
  if [ -d $d ] ; then
    cd $d
    rm *.cgm
    cd GIFS
    mv * ../
    cd ../
    rm -rf GIFS
    cd ../
  fi
done
tar cf ../$dir.tar *

