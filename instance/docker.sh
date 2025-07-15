sudo dnf -y install dnf-plugins-core # Install necessary plugins
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo # Add Docker repository
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y # Install Docker packages
sudo systemctl start docker # Start Docker service
sudo systemctl enable docker # Enable Docker service
sudo usermod -aG docker ec2-user # Add user to Docker group

growpart /dev/nvme0n1 4
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/varVol

xfs_growfs /
xfs_growfs /var