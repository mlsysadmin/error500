apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: error
spec:
  template:
    metadata:
      annotations:
        run.googleapis.com/vpc-access-connector: "${VPC_CONNECTOR}"
        run.googleapis.com/ingress: "internal-only"
    spec:
      containers:
        - image: IMAGE_PLACEHOLDER
