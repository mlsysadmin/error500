apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  # Dynamic service name includes the target environment
  name: error-pipeline-mlfsi-jupiter-apollo-${TARGET_ID}
  namespace: default
spec:
  template:
    spec:
      containers:
      - image: asia-southeast1-docker.pkg.dev/mlfsi-jupiter-apollo/error:${COMMIT_SHA}
        env:
        - name: ENV
          value: ${TARGET_ID}  # Tells app what environment it’s running in (dev, qa, etc.)
        resources:
          limits:
            memory: "512Mi"
            cpu: "1000m"
