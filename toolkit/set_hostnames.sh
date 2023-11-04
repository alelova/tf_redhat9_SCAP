#! /bin/bash
export server1="$(./aws_describe-instances.sh|grep 003|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}') lab-rh9-003"
export server2="$(./aws_describe-instances.sh|grep 004|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}') lab-rh9-004"
sudo sed  -i '/lab/d' /etc/hosts
echo $server1 | sudo tee --append /etc/hosts
echo $server2 | sudo tee --append /etc/hosts

#rm ~/.ssh/known_hosts
ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R "lab-rh9-003"
ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R "lab-rh9-004"
#### set lab-rh9-003
   ssh -o StrictHostKeyChecking=no student@lab-rh9-003 sudo hostnamectl set-hostname lab-rh9-003 
   ssh student@lab-rh9-003 sudo sed  -i '/lab/d' /etc/hosts
   ssh student@lab-rh9-003 "echo "$server1" | sudo tee --append /etc/hosts"
   ssh student@lab-rh9-003 "echo "$server2" | sudo tee --append /etc/hosts"

#### set lab-rh9-004
   ssh -o StrictHostKeyChecking=no student@lab-rh9-004 sudo hostnamectl set-hostname lab-rh9-004 
   ssh student@lab-rh9-004 sudo sed  -i '/lab/d' /etc/hosts
   ssh student@lab-rh9-004 "echo "$server1" | sudo tee --append /etc/hosts"
   ssh student@lab-rh9-004 "echo "$server2" | sudo tee --append /etc/hosts"

#### temporary shutdown lab-rh9-004
   ssh student@lab-rh9-004 "sudo shutdown -h now"

#### clean puppet server to reconnect server
   ssh student@puppet "sudo -i  puppetserver ca clean --certname lab-rh9-003.eu-central-1.compute.internal"
   
