#!/bin/sh

# DartDefineを書き込んだり、Flavorごとのxcconfigをincludeするファイル
OUTPUT_FILE="${SRCROOT}/Flutter/DartDefine.xcconfig"

# Flutter2.2以降で必要な、DartDefineのデコード処理
function decode_url() { echo "${*}" | base64 --decode; }

# 最初にファイル内容をいったん空にする
: > $OUTPUT_FILE

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

echo "define_items: $define_items"

for index in "${!define_items[@]}"
do
    # Flutter2.2以降で必要なデコードを実行する
    item=$(decode_url "${define_items[$index]}")
    
    echo "item: $item"
    
    # FLAVORが含まれるDartDefineの場合
    if [ $(echo $item | grep 'FLAVOR') ] ; then
        # FLAVORの値(=の右側)
        value=${item#*=}
        # FLAVORに対応したxcconfigファイルをincludeさせる
        echo "#include \"$value.xcconfig\""
        echo "#include \"$value.xcconfig\"" >> $OUTPUT_FILE
    fi
done
