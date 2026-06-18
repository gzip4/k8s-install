set -ex

# cli completion
sudo apt-get install bash-completion -y
echo "source <(kubectl completion bash)" >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc
