#!/bin/sh

DIR=`pwd`
for file in ./test-dmg-files/*.dmg; do
  tmp=`mktemp -d`
  cd $tmp
  $DIR/undmg < "$DIR/$file"
done
