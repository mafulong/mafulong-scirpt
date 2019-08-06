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

# 删除本地分支和远程分支
function del_branch(){
    if [ ! -n "$1" ];then
        echo "输入分支名啊，傻子"
        return
    fi
    for i in $*               #在$*中遍历参数，此时每个参数都是独立的，会遍历$#次
    do
      echo "分支: " $i
      git branch -D $i
      git push origin --delete $i
    done

}
