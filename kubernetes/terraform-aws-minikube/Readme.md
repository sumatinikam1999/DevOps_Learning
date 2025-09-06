minikube
ls -lrt
mkdir .kube
cp kubeconfig .kube/config
kubectl get nodes
cat config/kubeconfig

---------------------------


workstation
tail -f /var/log/cloud-init-output.log


install kubectl on amazon linux 2023
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

mkdir .kube
cd .kube
vim config
cd
kubectl get nodes
kubectl get namespaces

kubectl create -f namespace.yaml

kubectl get namespaces

kubectl apply -f namespace.yaml

kubectl delete -f namespace.yaml
