set -ex

CIDR=10.10.0.0/16

# Needs manual creation of namespace to avoid Helm error
kubectl create ns kube-flannel
kubectl label --overwrite ns kube-flannel pod-security.kubernetes.io/enforce=privileged

helm repo add flannel https://flannel-io.github.io/flannel/
helm install flannel --set podCidr=$CIDR --namespace kube-flannel flannel/flannel
