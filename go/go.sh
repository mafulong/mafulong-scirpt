function gomod(){
    if [ ! -n "$1" ];then
        echo "使用方法"
        echo "gomod on/off/auto"
        echo "off 则go命令从不使用新模块支持。它查找vendor 目录和GOPATH以查找依赖关系;也就是继续使用“GOPATH模式”。\non 则go命令需要使用模块，go 会忽略 $GOPATH 和 vendor 文件夹，只根据go.mod下载依赖。\nauto 或未设置，则go命令根据当前目录启用或禁用模块支持。仅当当前目录位于$GOPATH/src之外并且其本身包含go.mod文件或位于包含go.mod文件的目录下时，才启用模块支持。"
        return
    fi
    export GO111MODULE=$1
    echo "gomod值: " $GO111MODULE
}
