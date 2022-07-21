# Security Context 

When designing your containers and pods, make sure that you configure the security context for your pods, containers and volumes. A security context is a property defined in the deployment yaml. It controls the security parameters that will be assigned to the pod/container/volume

To read more about security context in Kubernetes [here](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)

Example

```yml
apiVersion: v1  
kind: Pod  
metadata:  
  name: hello-world  
spec:  
  containers:  
  # specification of the pod’s containers  
  # ...  
  securityContext:  
    runAsUser: 1000
    runAsGroup: 3000
    readOnlyRootFilesystem: true  
    runAsNonRoot: true
```

Some of the important parameters are:

|Security Context Setting |	Description |
|---|---|
| SecurityContext->runAsNonRoot |	Indicates that containers should run as non-root user	SecurityContext->Capabilities	Controls the Linux capabilities assigned to the container.	|
| SecurityContext->readOnlyRootFilesystem | Controls whether a container will be able to write into the root filesystem. |
| PodSecurityContext->runAsNonRoot	| Prevents running a container with 'root' user as part of the pod |

Read more about the security context object [here](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#securitycontext-v1-core)