set -ex

VERSION=1.28
OS=Debian_12
echo "deb [signed-by=/etc/apt/keyrings/crio-runc-apt-keyring.gpg] https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/$OS/ /" | sudo tee /etc/apt/sources.list.d/libcontainers:stable.list
echo "deb [signed-by=/etc/apt/keyrings/crio-apt-keyring.gpg] http://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:/$VERSION/$OS/ /" | sudo tee -a /etc/apt/sources.list.d/libcontainers:stable:cri-o:$VERSION.list
curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/$OS/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/crio-runc-apt-keyring.gpg
curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/crio-apt-keyring.gpg
sudo apt-get update
sudo apt-get install -y cri-o cri-o-runc cri-tools
sudo systemctl daemon-reload
sudo systemctl enable --now crio
