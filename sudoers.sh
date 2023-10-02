sudo cat << EOF > /etc/sudoers.d/permission
%domain\ admins@vaival.tech ALL=(ALL:ALL) NOPASSWD: ALL
%domain\ users@vaival.tech ALL=(ALL:ALL) NOPASSWD: /usr/bin/systemctl, /usr/bin/openvpn
%testgroup@vaival.tech  ALL=(ALL:ALL) NOPASSWD: /usr/bin/systemctl, /usr/bin/openvpn
EOF

sudo chmod 440 /etc/sudoers.d/permission
