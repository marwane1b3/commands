#!/bin/bash
# ReactNative script to nuke all the things
# usage:
# - add each item below as a separate script in package.json
# - add one final script:
#   - "nuke": "yarn clean-node-modules && yarn clean-pods && yarn clean-ios && yarn clean-android && yarn clean-rn-cache"
# - alternatively, copy this shell script and add the following cmd to package.json:
#   - "nuke": "./react-native-nuke-sh"
#   - you may need to run `sudo chmod 777 ./react-native-nuke-sh before this script can run`

echo "                              ____                      "
echo "                      __,-~~/~    \`---.                 "
echo "                    _/_,---(      ,    )                "
echo "                __ /        <    /   )  \___            "
echo "               ====------------------===;;;==           "
echo "                   \/  ~\"~\"~\"~\"~\"~\~\"~)~\",1/            "
echo "                   (_ (   \  (     >    \)              "
echo "                    \_( _ <         >_>'                "
echo "                       ~ \`-i' ::>|--\"                   "
echo "                           I;|.|.|                      "
echo "                          <|i::|i|>                     "
echo "                           |[::|.|                      "
echo "                            ||: |                       "
echo "______________________REACT NATIVE NUKE________________ "

# clean-node-modules
rm -rf node_modules && yarn

# clean-pods
cd ios/ && rm -rf Pods && pod install && cd ../

# clean-ios
rm -rf ios/build && rm -rf ~/Library/Developer/Xcode/DerivedData && rm -rf ./ios/DerivedData

# clean-android
cd android && ./gradlew clean && cd ..

# clean-rn-cache
rm -rf $TMPDIR/react-* && rm -rf $TMPDIR/react-native-packager-cache-* && rm -rf $TMPDIR/metro-bundler-cache-* && yarn cache clean && watchman watch-del-all && react-native start --reset-cache
