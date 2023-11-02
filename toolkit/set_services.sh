#! /bin/bash
echo instaling NFS service in lab-rh9-004
echo sharing /shares dir
#### set lab-rh9-004
#### set services lab-rh9-004
   ssh student@lab-rh9-004 sudo dnf install nfs-utils
   ssh student@lab-rh9-004 sudo systemctl enable --now nfs-server
   ssh student@lab-rh9-004 sudo mkdir -p /shares/direct/external
   ssh student@lab-rh9-004 sudo mkdir -p /shares/indirect/west
   ssh student@lab-rh9-004 sudo mkdir -p /shares/indirect/east
   ssh student@lab-rh9-004 sudo mkdir -p /shares/indirect/central
   ssh student@lab-rh9-004 sudo mkdir -p /shares/management
   ssh student@lab-rh9-004 sudo mkdir -p /shares/production
   ssh student@lab-rh9-004 sudo mkdir -p /shares/operation
   ssh student@lab-rh9-004 echo "'/shares servera(rw)' | sudo tee /etc/exports.d/lab.exports"
   ssh student@lab-rh9-004 sudo systemctl reload nfs-server

echo instaling httpd service in lab-rh9-004
   ssh student@lab-rh9-004 sudo dnf install httpd
   ssh student@lab-rh9-004 sudo systemctl enable --now httpd
