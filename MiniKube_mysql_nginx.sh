#!/bin/bash

# Update package list
sudo apt update

# Step 1: Install Docker
echo "Installing Docker..."
sudo apt install docker.io -y
sudo service docker restart
sudo service docker status

# Step 2: Configure Docker Permissions
echo "Configuring Docker permissions..."
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Step 3: Verify Docker Installation
echo "Verifying Docker installation..."
docker images
docker ps

# Step 4: Install Kubectl
echo "Installing Kubectl..."
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client

# Step 5: Install Minikube
echo "Installing Minikube..."
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Step 6: Start Minikube
echo "Starting Minikube..."
minikube start
minikube status

# Step 7: Create Docker Compose YAML File
echo "Creating docker-compose.yml file..."
cat <<EOF > docker-compose.yml
version: '3'

services:
  web:
    image: nginx:latest
    ports:
      - 80:80

  db:
    image: mysql:latest
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=secret
    ports:
      - 3306:3306
EOF

# Step 8: Start Docker Containers
echo "Starting Docker containers..."
docker-compose up -d

# Step 9: Wait for MySQL to Initialize
echo "Waiting for MySQL to initialize..."
sleep 20  # Give MySQL time to start

# Step 10: Access MySQL inside the container
echo "Accessing MySQL inside the container..."
docker exec -it $(docker ps -qf "ancestor=mysql:latest") mysql -u root -psecret

# Step 11: Deploy Nginx with Kubernetes
echo "Deploying Nginx on Kubernetes..."
kubectl run nginx-wsl --image=nginx --port=8999

# Step 12: Check Docker and Minikube status
echo "Checking Docker and Minikube status..."
docker images
minikube stop

echo "Setup complete!"
