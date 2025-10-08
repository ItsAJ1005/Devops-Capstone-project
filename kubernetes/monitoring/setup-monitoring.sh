#!/bin/bash

# Add and update the Prometheus Community Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create monitoring namespace
kubectl create namespace monitoring

# Install kube-prometheus-stack
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
  --set prometheus.prometheusSpec.podMonitorSelectorNilUsesHelmValues=false \
  --set prometheus.prometheusSpec.ruleSelectorNilUsesHelmValues=false \
  --set prometheus.prometheusSpec.serviceMonitorSelector={} \
  --set prometheus.prometheusSpec.podMonitorSelector={} \
  --set prometheus.prometheusSpec.ruleSelector={} \
  --set grafana.enabled=true \
  --set grafana.service.type=LoadBalancer \
  --set grafana.adminPassword=admin \
  --set grafana.persistence.enabled=true \
  --set grafana.persistence.size=10Gi

# Wait for pods to be ready
echo "Waiting for monitoring pods to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=grafana -n monitoring --timeout=300s
kubectl wait --for=condition=ready pod -l app=prometheus-operator -n monitoring --timeout=300s

# Get Grafana service details
GRAFANA_PORT=$(kubectl get svc -n monitoring prometheus-grafana -o jsonpath='{.spec.ports[?(@.name=="service")].nodePort}')
GRAFANA_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')

# Get Grafana admin password (base64 encoded)
GRAFANA_PASSWORD=$(kubectl get secret --namespace monitoring prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode)

echo ""
echo "======================================="
echo "Grafana is now available at:"
echo "URL: http://${GRAFANA_IP}:${GRAFANA_PORT}"
echo "Username: admin"
echo "Password: ${GRAFANA_PASSWORD}"
echo ""
echo "To access Prometheus:"
echo "kubectl port-forward -n monitoring svc/prometheus-kube-prometheus-prometheus 9090"
echo ""
echo "To access Alertmanager:"
echo "kubectl port-forward -n monitoring svc/prometheus-kube-prometheus-alertmanager 9093"
echo "======================================="
echo ""

# Create a service monitor for our application
kubectl apply -f - <<EOF
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: devops-app-monitor
  namespace: monitoring
  labels:
    app: devops-app
    release: prometheus
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "devops-app.name" . }}
  endpoints:
  - port: http
    interval: 30s
    path: /metrics
  namespaceSelector:
    any: true
EOF

echo "ServiceMonitor for the application has been created."
