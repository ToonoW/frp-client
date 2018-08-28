echo "install software"
apt update && apt install -y wget vim openssh-server

echo "start sshd"
service ssh start

echo "add user"
adduser --no-create-home --disabled-password guestuser
chmod 600 /etc/sudoers
echo "guestuser ALL=(ALL) ALL" >> /etc/sudoers
echo guestuser:123456 | chpasswd

echo "download software"
mkdir /frp-ssh
wget -P /frp-ssh/ http://119.29.168.240:6008/static/frp-client/frpc-amd64
wget -P /frp-ssh/ http://119.29.168.240:6008/static/frp-client/frpc-ssh-nei.ini
chmod 777 /frp-ssh/frpc-amd64

echo "start frpc"
nohup /frp-ssh/frpc-amd64 -c /frp-ssh/frpc-ssh-nei.ini &
