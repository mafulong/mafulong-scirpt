# 比较历史git commit diff
function gdf(){
    if [ ! -n "$1" ];then
        echo "gdf a b"
        echo "查看git log a到b之间diff, 如果b为空，则a到现在的diff"
        return
    fi
    if [ ! -n "$2" ];then
        a=$1
        cmd="git diff HEAD~$a HEAD"
        echo $cmd
        eval $cmd
    else
        a=$1
        b=$2
        cmd="git diff HEAD~$a HEAD~$b"
        echo $cmd
        eval $cmd
    fi
}

