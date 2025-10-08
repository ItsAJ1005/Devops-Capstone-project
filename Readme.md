# DevOps Pipeline Demo

A complete end-to-end DevOps pipeline implementation that demonstrates CI/CD best practices using modern tools and technologies.

## 🚀 Features

- **Source Control**: GitHub for version control
- **CI/CD**: Jenkins for continuous integration and deployment
- **Infrastructure as Code**: Terraform for provisioning cloud resources
- **Containerization**: Docker for packaging applications
- **Orchestration**: Kubernetes for container orchestration
- **Monitoring**: Prometheus and Grafana for monitoring and visualization

## 📦 Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Kubernetes](https://kubernetes.io/docs/setup/) (Minikube or cloud provider)
- [Terraform](https://www.terraform.io/downloads.html) (>= 1.0.0)
- [Jenkins](https://www.jenkins.io/doc/book/installing/)
- [Node.js](https://nodejs.org/) (>= 16.x)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/) (for deploying monitoring stack)

## 🛠️ Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd devops-pipeline-demo
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Configure Environment Variables

Create a `.env` file in the root directory:

```env
PORT=3000
NODE_ENV=development
```

### 4. Run the Application Locally

```bash
npm start
```

Visit `http://localhost:3000` in your browser.

## 🚀 CI/CD Pipeline

The pipeline includes the following stages:

1. **Source Control**: Code is pushed to GitHub
2. **CI/CD**: Jenkins picks up changes and runs the pipeline
3. **Build & Test**: Application is built and tests are executed
4. **Containerization**: Application is packaged into a Docker container
5. **Infrastructure**: Terraform provisions the required infrastructure
6. **Deployment**: Application is deployed to Kubernetes
7. **Monitoring**: Prometheus and Grafana are set up for monitoring

## 🏗️ Infrastructure

Infrastructure is defined as code using Terraform. The following resources are provisioned:

- VPC Network
- Subnet
- GKE Cluster
- Node Pools
- Service Accounts with IAM roles

To initialize and apply the Terraform configuration:

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## 🐳 Kubernetes Deployment

The application is deployed to a Kubernetes cluster with the following components:

- **Deployment**: Manages the application pods
- **Service**: Exposes the application within the cluster
- **Ingress**: Manages external access to the services

## 📊 Monitoring

Monitoring is set up using:

- **Prometheus**: For metrics collection
- **Grafana**: For visualization
- **Node Exporter**: For hardware and OS metrics
- **Kube State Metrics**: For Kubernetes metrics

## 🧪 Testing

Run tests using:

```bash
npm test
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Node.js](https://nodejs.org/)
- [Express](https://expressjs.com/)
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)
- [Terraform](https://www.terraform.io/)
- [Jenkins](https://www.jenkins.io/)