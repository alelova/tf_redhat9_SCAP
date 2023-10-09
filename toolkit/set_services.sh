#! /bin/bash
echo installing NFS service in serverb
echo sharing /shares dir
#### set serverb
#### set services serverb
   ssh student@serverb sudo dnf install nfs-utils
   ssh student@serverb sudo systemctl enable --now nfs-server
   ssh student@serverb sudo mkdir -p /shares/direct/external
   ssh student@serverb sudo mkdir -p /shares/indirect/west
   ssh student@serverb sudo mkdir -p /shares/indirect/east
   ssh student@serverb sudo mkdir -p /shares/indirect/central
   ssh student@serverb sudo mkdir -p /shares/management
   ssh student@serverb sudo mkdir -p /shares/production
   ssh student@serverb sudo mkdir -p /shares/operation
   ssh student@serverb echo "'/shares servera(rw)' | sudo tee /etc/exports.d/lab.exports"
   ssh student@serverb sudo systemctl reload nfs-server
