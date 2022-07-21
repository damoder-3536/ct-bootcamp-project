
# K8s - Init container

## Introduction

init containers are specialized containers that run before app containers in a Pod. Init containers can contain utilities or setup scripts not present in an app image.A pod can have Init Containers 

For more details about init-containers refer https://kubernetes.io/docs/concepts/workloads/pods/init-containers/

## Prerequisites

- Neudesic app mod repo (https://github.com/NeudesicIndia/app-mod-accelerators)
- A Kubernetes cluster (Minikube, k3s, Kubernetes on Docker Desktop or any cloud provided cluster)
- Docker daemon running in your machine

## Use case from the project

Api in this project uses data.json. During deployment this data.json would be initialized by k8s init container. This seperates data to a different docker image that can be a secret and deployed only in the needed environment. Rest of the development can happen from local data.json.

## Steps to follow

Create Docker image of the data by using the following command. Dockerfile is avaiable from appmod-devops-inticontainer-data

```console
$ docker build -t datainit:v1 . 
```

Create Docker image of the service by using the following command. Dockerfile is avaiable from aappmod-devops-initcontainer-service

```console
$ docker build -t netcoreweatherapicontainer:v1 . 
```
Create Kubernetes deployment using the below command

```console
$ kubectl apply -f .\deploy.yml
```

The data.json copied by initcontainer can be found in the pod filesystem by using the below command

```console
$ kubectl exec -it <POD NAME> sh
```



