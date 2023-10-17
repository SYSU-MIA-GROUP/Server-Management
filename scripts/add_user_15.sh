# first upload the id_rsa.pub to the directory ./temp 
# sudo bash add_user_15.sh username group
param_cnt=$#
echo receive $param_cnt parameters
if [ $param_cnt -ne 2 ]; then
    echo Error! 2 parameters needed, one for username and one for group, but get only $param_cnt param
    exit 1
fi

group_exists=$(getent group $2)
if [ -z "$group_exists" ]; then
    echo Group $2 does not exist. Creating the group...
    groupadd $2
fi

# you may change the path of user_home and pub_dir
echo ready to create user $1 of group $2
user_home=/data15/data15_5/$1
pub_dir=/data15/data15_5/guangxing/temp

useradd -d $user_home -g $2 -s /bin/bash -m $1
echo the home directory of $1 is $user_home
mv $pub_dir/*.pub $user_home

cd $user_home
mkdir .ssh
mv *.pub .ssh/id_rsa.pub
cd .ssh
touch authorized_keys
cat id_rsa.pub >> authorized_keys

chmod 600 authorized_keys
cd ..
chmod 700 .ssh
chown -R $1:$2 .ssh

echo finished!!
