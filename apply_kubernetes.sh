#!/bin/bash

# Directory where your Kubernetes YAML files are located
KUBE_DIR="kubernetes"
# Namespace
NAMESPACE="karsajobs-app"

# Apply the namespace
echo "Applying namespace resources..."
kubectl apply -f "$KUBE_DIR/namespace.yaml"

# Apply the MongoDB resources
echo "Applying MongoDB resources..."
kubectl apply -f "$KUBE_DIR/mongodb/mongo-statefulset.yml" -n $NAMESPACE
kubectl apply -f "$KUBE_DIR/mongodb/mongo-service.yml" -n $NAMESPACE
kubectl apply -f "$KUBE_DIR/mongodb/mongo-configmap.yml" -n $NAMESPACE
kubectl apply -f "$KUBE_DIR/mongodb/mongo-secret.yml" -n $NAMESPACE
kubectl apply -f "$KUBE_DIR/mongodb/mongo-pv-pvc.yml" -n $NAMESPACE

# Apply the backend resources
echo "Applying backend resources..."
kubectl apply -f "$KUBE_DIR/backend/karsajobs-service.yml" -n $NAMESPACE
kubectl apply -f "$KUBE_DIR/backend/karsajobs-deployment.yml" -n $NAMESPACE

# Apply the frontend resources
echo "Applying frontend resources..."
kubectl apply -f "$KUBE_DIR/frontend/karsajobs-ui-service.yml" -n $NAMESPACE
kubectl apply -f "$KUBE_DIR/frontend/karsajobs-ui-deployment.yml" -n $NAMESPACE

echo "All resources applied successfully."
