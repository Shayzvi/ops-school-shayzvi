#!/bin/bash
#add fix to exercise5-server1 here

#create keys
ssh-keygen -f /home/vagrant/.ssh/id_rsa -P ""
sudo chown -R vagrant:vagrant /home/vagrant/.ssh

#add the public key to the authorized keys list 
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

#copy ssh directory to a shared location
cp -a /home/vagrant/.ssh/ /vagrant/

#fix permissions for root
sudo cp /vagrant/.ssh/authorized_keys /root/.ssh/
sudo cp /vagrant/.ssh/id_rsa /root/.ssh/
sudo cp /vagrant/.ssh/id_rsa.pub /root/.ssh/
sudo chmod 600 /root/.ssh/id_rsa

#turn off host key checking
sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo service ssh restart

