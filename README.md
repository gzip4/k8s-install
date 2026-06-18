# Kubernetes install scripts

### K8S Releases
https://kubernetes.io/releases/download/

### CRI-O Releases
https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/

### Apt proxy
Add file /etc/apt/apt.conf.d/proxy.conf with line:
Acquire::http::Proxy "socks5h://user:pass@host:port/";
