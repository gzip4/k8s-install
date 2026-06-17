set -ex

CIDR=10.10.0.0/16

# set up ranges/subnet $CIDR
# for flannel: remove this file
#sudo mcedit /etc/cni/net.d/100-crio-bridge.conflist

sudo kubeadm init --pod-network-cidr=$CIDR --cri-socket unix:///var/run/crio/crio.sock --ignore-preflight-errors Mem

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/control-plane-
