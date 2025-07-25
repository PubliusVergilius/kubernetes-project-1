dnf update -y
# Kubect
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.33/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.33/rpm/repodata/repomd.xml.key
EOF
sudo yum install -y kubectl

# Docker
dnf -y install dnf-plugins-core
dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo -y
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
dnf install docker -y

echo 'Setting up docker...'
systemctl enable --now docker
usermod -aG docker $USER && newgrp docker
docker version

# Minikube
echo 'Downloading Minikube...'
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64 -y
minikube start --driver=docker

# Minikube dashboard
minikube dashboard --url=false --port=9090
kubectl get pods -n kubernetes-dashboard
kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard 9000:80



