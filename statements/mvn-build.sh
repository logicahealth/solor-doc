#!/bin/sh
source ~/.bash_profile
mvn -e clean install
osascript openpdf.scpt
