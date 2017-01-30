#!/bin/bash

BASEDIR=process.env.BASEDIR
file=${BASEDIR}/configs/.build
timestamp=$(date +%s)
os=`uname -a`

cat << JSON > $file
{"time":${timestamp},"os":"${os}"}
JSON

echo ""
echo "Build data updated."
echo ""
