# 代理
function proxy(){
    cmd = "export http_proxy=ip:port https_proxy="
    echo $cmd
    eval $cmd
}
function noproxy(){
    unset http_proxy
    unset https_proxy
}
