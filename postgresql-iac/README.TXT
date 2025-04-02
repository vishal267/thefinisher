#Install Kind, Kubectl and helm 
brew install go
brew install kind
brew install kubectl 
brew install helm 
kind create cluster --name=multi-node-cluster --config=multi-node-cluster.yaml

kind get clusters
kubectl get no 

Now Run TF code for creating K8s resources using helm release 
terraform init 
terraform plan 
terraform apply --auto-approve 

helm ls -n postgresql 
kubectl get all -n postgresql
