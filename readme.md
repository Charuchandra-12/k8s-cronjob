# Kubernetes Cron Job for Node Metrics Collection

## Solution Overview

### Design and Implementation

1. **Docker Engine Installation:**

   - Installed Docker Engine from [Docker Desktop](https://www.docker.com/products/docker-desktop).

2. **Minikube Setup:**

   - Installed minikube from [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Fx86-64%2Fstable%2Fhomebrew).

   - Started minikube with Docker as the VM driver using the following command:
     ```bash
     minikube start --vm-driver=docker
     ```

3. **Directory Mounting for Data Persistence:**

   - Mounted the local directory for data persistence with the following command:
     ```bash
     minikube mount /Users/chinmaykubal/Desktop/metrics:/mnt/metrics
     ```

4. **Docker Image Creation:**

   - Created the Docker image using:
     ```bash
     docker build --platform linux/amd64 -t chinmaykubal/collect_metrics .
     ```
   - Pushed the image to Docker Hub:
     ```bash
     docker push chinmaykubal/collect_metrics
     ```

5. **Kubernetes Deployment:**

   - Created and applied the necessary Kubernetes YAML files:
     - **Persistent Volume and Persistent Volume Claim (pv_pvc.yaml)**
       ```bash
       kubectl apply -f pv_pvc.yaml
       ```
     - **Node Exporter DaemonSet (node-exporter-daemonset.yaml)**
       ```bash
       kubectl apply -f node-exporter-daemonset.yaml
       ```
     - **CronJob (cronjob.yaml)**
       ```bash
       kubectl apply -f cronjob.yaml
       ```
   - The cron job now generates metrics data every minute, which is persisted in the local drive.

6. **Demo Video:**
   - A demo [Video](https://youtu.be/oBkeU9kncBQ) has been created to showcase the entire process and the output files generated.
