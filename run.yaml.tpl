apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: error-pipeline-${TARGET_ID}
  namespace: default
spec:
  template:
    spec:
      containers:
      - image: {{ .IMAGE }}
        env:
        - name: ENV
          value: ${TARGET_ID}
        resources:
          limits:
            memory: "512Mi"
            cpu: "1000m"
