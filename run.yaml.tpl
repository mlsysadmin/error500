apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: error-{{ .DEPLOY_REGION }}
  namespace: default
spec:
  template:
    spec:
      containers:
        - image: {{ .IMAGE }}
          ports:
            - containerPort: 9001
