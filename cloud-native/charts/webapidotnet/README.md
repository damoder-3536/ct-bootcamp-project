# dotnet core microservice helm chart

```console
$ helm install release-1 webapidotnet -f webapidotnet/values.yaml --namespace app-dev
```

## Introduction

This chart bootstraps a microservice deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


## Prerequisites

- Kubernetes 1.12+
- Helm 2.11+ or Helm 3.0-beta3+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `release-1` in the namespace `app-dev` using a custom values file:

```console
$ helm install release-1 webapidotnet -f webapidotnet/values.dev.yaml --namespace app-dev 
```

The command deploys chart on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list --namespace app-dev`

## Uninstalling the Chart

To uninstall/delete the `release-1` deployment:

```console
$ helm uninstall release-1 --namespace app-dev
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the Ghost chart and their default values.

> **Note**:
>
> For the microservice application function correctly, you should specify the `environment.ingressClass` parameter to specify the Ingress controller, since we don't expose microservice dirctly by LoadBalancer. 
>
> Optionally, you can use `kubectl port-forward <pod-name> <port> --namespace <ns>` to port forward to your machine localhost and test the service independently 
>
> To get the ingress IP `kubectl get ingress <ingressName> --namespace <ns> -o jsonpath='{..status.loadBalancer.ingress[0].ip}'`

## Customize the Helm Install

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release \
  --set fullnameOverride=customapp,ingress.enabled=true,\
        service.type=loadBalancer \
        webapidotnet
```

Alternatively, a custom YAML file `values.custom.yaml` that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.custom.yaml webapidotnet
```