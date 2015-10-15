#!/bin/sh

echo "Current directory: " `pwd` "\n"
for n in *.dart 
do echo ==== $n; 
# echo $n |grep "_lib\.dart" 
  if test -z `echo $n |grep "_lib.dart"`
  then 
    grep "\@compile-error" $n
    grep "\@static-warning" $n
    grep "\@issue" $n
    echo "- - dart"
    dart $n
    echo "- - dart -c"
    dart -c $n
    echo "- - dartanalyzer"
    dartanalyzer $n
  fi
  echo " "
done
