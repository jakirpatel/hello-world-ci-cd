# Hello World - Continuous Integration and Continuous Deployment

### Stable Versions
1. Docker : 1.12.6
2. Kubernetes : 1.7.0
3. NPM : 3.5.2
4. Node Image : Boron

### CI | CD Pipeline Overview

![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/diagram.jpeg)


### Tools and Technologies used
1. SCM: Github
2. Build: Shell Script and SSH
3. REPO Management: Docker Hub
4. CI and CD: Jenkins, SSH, and Terraform (K8S cluster creation with Kubernetes Operations via Terraform manifests)
5. Testing: Mocha and SonarQube
6. Collaboration and Communication: Slack
7. Operational Intelligence: Datadog
8. Container Security: Anchore Scanner
9. Deployment: Kubernetes, Amazon Web Services, and Docker
10. Logging: Sematext

### CI and CD Implementation
## Build Actions:
1. SCM - Github polling included for the all the branches. Jenkins is self-hosted on AWS. Jenkins is deployed with master and slave architecture. Jenkins-MAster and Jenkins-Slave.
2. Building the Job: Webhook is added to the GitHub repo and builds job is executed with the shell script.
3. Steps followed to build job:
   i. Pulling the branch and checkout
  ii. SonarQube Analysis of the Code
  iii. Shell Script: Creates the test container which will execute the sample tests. If succeed then an image is prepared for production. Docker login with environment variables attached with Jenkins-slave node. Check `hello-world-ci-cd/deploy-docker.sh`.
4. Anchore scanning of the Images to check container security.
5. Deleting test images from local Jenkins-slave through the shell script. Check `hello-world-ci-cd/delete-docker.sh`.

## Post Build Actions:
1. Shell Script: Logging into the cluster node. Download the manifests from the Github and apply the changes. Rolling update and rollback options are given through environment variable `DEPLOYMENT_TYPE`. Check `hello-world-ci-cd/post-build.sh`.
2. Setting up the GitHub commit status.
3. Slack Notifications of the build actions to notify the status.

## Production Grade Monitoring and Logging
### Monitoring Tools used: Datadog (internally using cloudwatch and cloud trail), Heapster (Native monitoring for the Kubernetes).

Datadog is used for operational intelligence. Datadog is connected with the slack channel for sending the alert. Kubernetes, Docker and AWS specific metrics are provided with Datadlg with the in-depth level of customization and alerts.Check `hello-world-ci-cd/kubernetes/monitor/dd-agent.yml`

![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/Screenshot%20from%202017-10-11%2001-10-25.png)

Define Monitors to trigger the events (Warning, alert, ok ):

![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/Screenshot%20from%202017-10-11%2000-36-04.png)

Kubernetes native level monitoring with heapster allows horizontally scale the Pods. Here, the pod is deployment unit for kubernetes. In this deployment, one pod only consists one container. With the use of heapster horizontal pod, scaling is added with default minimum 5 to maximum 50 replicas. Check `hello-world-ci-cd/kubernetes/autoscaler/pod-autoscaler.yml`

Datadog also monitors the Kubernetes Metrics:
![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/Screenshot%20from%202017-10-10%2020-46-37.png)

## Logging with Sematext
The container logs are centralized with sematext. Check `hello-world-ci-cd/kubernetes/logging/sematext-agent.yml`.
![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/Screenshot%20from%202017-10-11%2002-04-09.png)

# Highly Available and secure application with Kubernetes, Docker, and AWS.
### Highly Available Kubernetes Cluster on AWS:
1. Node Zones: us-east-1a,us-east-1b,us-east-1c
2. Master Zones: us-east-1a,us-east-1b,us-east-1c
3. Number of Master Nodes: 3
4. Number of Nodes: 3
5. Container Networking: Flannel
6. Cluster Environment: Private
7. Bastion host: Used
8. etc is encrypted for the storage.

### Highly available app with Kubernetes.
App is deployed with Kubernetes deployment and service objects. Check `hello-world-ci-cd/kubernetes/app/`.
### Architecture
![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/kops_k8s_cluster_aws.png)

Horizontal Pod Autoscaler is created for the app pods. Check `hello-world-ci-cd/kubernetes/autoscaler/`.
The app is exposed with service object of the Kubernetes through classic load balancer of the AWS.

### Alerts to Slack
![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/Screenshot%20from%202017-10-11%2003-25-09.png)

![N|Solid](https://raw.githubusercontent.com/jakirpatel/hello-world-ci-cd/master/images/Screenshot%20from%202017-10-11%2003-25-18.png)

The final endpoint is `http://app.dockerslab.com`.
