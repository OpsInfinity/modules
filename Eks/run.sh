#!/bin/bash
# Purpose: The script ensures that your local kubectl is configured to interact with a specific EKS cluster. It retrieves the necessary credentials and cluster details from AWS and updates the local kubeconfig file.

# Update kubeconfig for AWS EKS cluster
# Replace <cluster_name> and <region> with your EKS cluster name and AWS region

CLUSTER_NAME="<cluster_name>"
REGION="<region>"

aws eks update-kubeconfig --name "$CLUSTER_NAME" --region "$REGION"



# install kubectl
# This script installs kubectl, the command-line tool for interacting with Kubernetes clusters.

## Check Root User

if [ $(id -u) -ne 0 ]; then
  echo "You should be root user to perform this script"
  exit 1
fi

curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /bin/kubectl



# Deploy the Kubernetes Metrics Server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
