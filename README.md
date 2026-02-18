# DevOps Application Deployment (Guvi Project 3)
Project Overview:
This project demonstrates a complete CI/CD pipeline for a containerized React application. The application is built using Docker, integrated with Jenkins for Continuous Integration, pushed to DockerHub, deployed on AWS EC2, and monitored using an open-source monitoring tool.

The objective is to implement a structured DevOps workflow covering version control, containerization, automation, cloud deployment, and monitoring.

Architecture:
The workflow of this project is as follows:
GitHub → Jenkins → DockerHub → AWS EC2 → Monitoring
Developers push code to GitHub (dev or master branch).
Jenkins detects changes and builds a Docker image.
The image is pushed to DockerHub.
The production image is pulled and run on an AWS EC2 instance.
The deployed application is monitored for availability.

Technologies Used:
React (Frontend Application)
Docker (Containerization)
DockerHub (Image Registry)
Jenkins (Continuous Integration)
AWS EC2 (Cloud Deployment)
Uptime Kuma (Monitoring)
Git and GitHub (Version Control)

Branching Strategy:
Two branches are used:
dev: Used for development builds. Jenkins builds and pushes the image to the public DockerHub dev repository.
master: Used for production builds. Jenkins builds and pushes the image to the private DockerHub production repository.

This ensures separation between development and production environments.

Docker Implementation:
The application is containerized using Docker.
The Dockerfile builds the React application and serves it using Nginx on port 80.
The container exposes port 80 to allow public access when deployed.

Shell Scripts: 
build.sh
Builds Docker image
Tags the image appropriately
Pushes the image to DockerHub

deploy.sh
Pulls the latest production image
Runs the container on port 80

These scripts simplify build and deployment operations.

Jenkins (Continuous Integration)
Jenkins is configured to:
Monitor GitHub repository
Trigger builds on dev and master branches
Build Docker images automatically
Push images to the appropriate DockerHub repositories

Branch-based logic ensures:
dev branch → public DockerHub repository
master branch → private DockerHub repository

DockerHub Repositories:
Two repositories are used:
dev (public)
prod (private)
Jenkins authenticates using stored credentials and pushes images automatically.

AWS Deployment:
An AWS EC2 Ubuntu instance is used for production deployment.
Steps performed:
Launch EC2 instance (t2.micro)
Configure Security Group:
SSH (22) → restricted to personal IP
HTTP (80) → open to public
Install Docker on EC2
Pull production image from DockerHub
Run container on port 80
The application is publicly accessible via:
http://<EC2-Public-IP>

Monitoring:
Uptime Kuma (open-source monitoring tool) is used to monitor application health.
Features implemented:
HTTP health check monitoring
Status tracking (UP/DOWN)
Real-time availability dashboard
The monitoring system verifies that the application is running and reachable.

How to Run Locally:
Clone the repository:
git clone <repository-url>
Build Docker image:
docker build -t app-name .
Run container:
docker run -d -p 80:80 app-name
Open browser:
http://localhost

Conclusion:
This project demonstrates a complete CI/CD pipeline including:
Version control with branching strategy
Docker-based containerization
Automated builds using Jenkins
Image management with DockerHub
Cloud deployment using AWS EC2
Application monitoring using an open-source tool
The implementation reflects real-world DevOps practices and separation of development and production workflows.
