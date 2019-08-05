remote_setting=""
cd ~
curl -s ${remore_setting} -a mafulogn_remote_setting
cat mafulogn_remote_setting > .gitconfig
rm mafulogn_remote_setting
