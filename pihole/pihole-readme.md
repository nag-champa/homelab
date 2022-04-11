#Installation Steps

Set up lxc container with ubuntu
Apply system updates
Install docker
Install docker-compose
Disable port 53 on localhost
Make docker_data directories
Run docker-compose to install pihole


#Disable DNS stub resolver on ubuntu platform
sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf

#Update symlink to /etc/resolv.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'

#Restart resolved service
sudo systemctl restart systemd-resolved