apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  # Dynamic service name includes the target environment
  name: error-pipeline-${TARGET_ID}
  namespace: default
spec:
  template:
    spec:
      containers:
      - image: asia-southeast1-docker.pkg.dev/ml-sandbox-project/error/error@sha256:7267852ed8ba10149b3a9bc82c160ed048dda1685ae46200943aade0fa8a4c27
        env:
        - name: ENV
          value: ${TARGET_ID}  # Tells app what environment it’s running in (dev, qa, etc.)
        resources:
          limits:
            memory: "512Mi"
            cpu: "1000m"
