#! /bin/bash

read -p "Clean the sync dir $1/$2 : (y/n)?  " CONT
if [ "$CONT" = "y" ]; then
  rm "$1/$2"/queue/*
  find "$1" -type f -name "$2" -exec rm "{}" \;
else
  echo 'cancel ...'
fi
