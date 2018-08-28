echo "install software"
apt update && apt install -y wget vim openssh-server

echo "start sshd"
service ssh start

echo "add user"
adduser --no-create-home --disabled-password wujinwen
chmod 600 /etc/sudoers
echo "wujinwen ALL=(ALL) ALL" >> /etc/sudoers
echo wujinwen:123456 | chpasswd

echo "download software"
mkdir /frp-ssh
wget -P /frp-ssh/ https://raw.githubusercontent.com/ToonoW/frp-client/master/frpc-amd64
wget -P /frp-ssh/ https://raw.githubusercontent.com/ToonoW/frp-client/master/frpc-ssh-nei.ini
chmod 777 /frp-ssh/frpc-amd64

"start frpc"
nohup /frp-ssh/frpc-amd64 -c /frpc-ssh-nei.ini &
