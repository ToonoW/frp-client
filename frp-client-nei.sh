apt update && apt install -y wget vim

mkdir /frp-ssh
wget -P /frp-ssh/ https://raw.githubusercontent.com/ToonoW/frp-client/master/frpc-amd64
wget -P /frp-ssh/ https://raw.githubusercontent.com/ToonoW/frp-client/master/frpc-ssh-nei.ini
chmod 777 /frp-ssh/frpc-amd64

nohup /frp-ssh/frpc-amd64 /frpc-ssh-nei.ini &


