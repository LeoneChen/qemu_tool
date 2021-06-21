# allow libvirt access /usr/local/bin
sudo touch /etc/apparmor.d/local/usr.sbin.libvirtd && \
sudo sh -c "cat /etc/apparmor.d/local/usr.sbin.libvirtd | grep -Fxq '/usr/local/bin/* PUx,' || echo '/usr/local/bin/* PUx,' >> /etc/apparmor.d/local/usr.sbin.libvirtd"
sudo apparmor_parser -r /etc/apparmor.d/usr.sbin.libvirtd