remote_setting="https://raw.githubusercontent.com/mafulong/mafulong-scirpt/master/git/gitconfig"
cd ~
cp .gitconfig .gitconfig_backup
echo ${remote_setting}
curl -s ${remote_setting} -o mafulong_remote_setting
cat mafulong_remote_setting >> .gitconfig
rm mafulong_remote_setting
