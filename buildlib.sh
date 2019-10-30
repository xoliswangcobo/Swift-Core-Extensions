#/bin/bash

#  buildlib.sh
#  Build Libs
#
#  Created by Xoliswa on 2019/10/30.
#  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
#  https://medium.com/onfido-tech/distributing-compiled-swift-frameworks-via-cocoapods-8cb67a584d57
#  https://unix.stackexchange.com/questions/129391/passing-named-arguments-to-shell-scripts
#  https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
#  https://stackoverflow.com/questions/5474732/how-can-i-add-a-help-method-to-a-shell-script
#

# usage discription
usage="Usage: $(basename "$0") [--name value] [--project value] [--scheme value] [--framework value] \n where: \n \
    --name      XCode library target name. \n \
    --project   XCode project file path. \n \
    --scheme    XCode library target scheme name. \n \
    --framework XCode library target output frameowrk name including '.framework' extension."

# variables
while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

# looking for required variables
if [ -z ${name+x} ]; then
    echo "\nXCode library target name is not provided.";
    echo "\n$usage\n"
    exit 10000
fi

if [ -z ${project+x} ]; then
    echo "\nXCode project file is not supplied.";
    echo "\n$usage\n"
    exit 10001
fi

if [ -z ${scheme+x} ]; then
    echo "\nXCode scheme name not supplied.";
    echo "\n$usage\n"
    exit 10002
fi

if [ -z ${framework+x} ]; then
    echo "\nXCode output framework name is not supplied.";
    echo "\n$usage\n"
    exit 10003
fi

# create folder where we place built frameworks
mkdir build

# build framework for simulators
xcodebuild clean build \
  -project $project \
  -scheme $scheme \
  -configuration Release \
  -sdk iphonesimulator \
  -derivedDataPath derived_data
  
# create folder to store compiled framework for simulator
mkdir build/simulator

# copy compiled framework for simulator into our build folder
cp -r derived_data/Build/Products/Release-iphonesimulator/$framework build/simulator

#build framework for devices
xcodebuild clean build \
  -project $project \
  -scheme $scheme \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath derived_data
  
# create folder to store compiled framework for simulator
mkdir build/devices

# copy compiled framework for simulator into our build folder
cp -r derived_data/Build/Products/Release-iphoneos/$framework build/devices

# create folder to store compiled universal framework
mkdir build/universal

####################### Create universal framework #############################

# copy device framework into universal folder
cp -r build/devices/$framework build/universal/

# create framework binary compatible with simulators and devices, and replace binary in unviersal framework
lipo -create \
  build/simulator/$framework/$name \
  build/devices/$framework/$name \
  -output build/universal/$framework/$name
  
# copy simulator Swift public interface to universal framework
cp build/simulator/$framework/Modules/$name.swiftmodule/* build/universal/$framework/Modules/$name.swiftmodule

