# Install Ubiquiti Unifi Controller on Ubuntu 20.04.
# As tested on a fresh install of ubuntu-20.04.1-live-server, August 22nd 2020.
# Thanks to https://gist.github.com/tmuncks for posting the updated install steps.

apt update
apt install --yes apt-transport-https

echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg

apt update
apt install --yes openjdk-8-jre-headless unifi
apt clean

systemctl status --no-pager --full mongodb.service unifi.service

# Now log into https://unifi_controller_hostname:8443/
