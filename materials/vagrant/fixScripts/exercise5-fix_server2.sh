#!/bin/bash
#add fix to exercise5-server2 here

#add the public key from shared directory to the authorized keys list 
cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

#copy keys from shared directory to local directory and fix pemissions
cp /vagrant/.ssh/id_rsa /home/vagrant/.ssh
cp /vagrant/.ssh/id_rsa.pub /home/vagrant/.ssh
sudo chmod 600 /home/vagrant/.ssh/id_rsa
sudo chown -R vagrant:vagrant /home/vagrant/.ssh

#the same for root
sudo cp /vagrant/.ssh/authorized_keys /root/.ssh/
sudo cp /vagrant/.ssh/id_rsa /root/.ssh/
sudo cp /vagrant/.ssh/id_rsa.pub /root/.ssh/
sudo chmod 600 /root/.ssh/id_rsa

#turn off host key checking
sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo service ssh restart

