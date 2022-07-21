# Jobs

Standard templates to create cronjob and Coarse Parallel Processing Using a Work Queue

## Job Patterns

To find out what is the best approach to run Job in kubernetes read more about [Job Patterns](https://kubernetes.io/docs/concepts/workloads/controllers/job/#job-patterns)

## Cron Jobs

A CronJob creates Jobs on a repeating schedule. Read more about cron jobs [here](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)

Use the cronjob template to deploy a cron job, The options are below

```yml
# Required field, 
# It takes a Cron format string, such as 0 * * * * or @hourly, 
# as schedule time of its jobs to be created and executed.
schedule: "*/1 * * * *"

# Optional, It stands for the deadline in seconds for starting the job if it misses its scheduled time for any reason. 
# After the deadline, the cron job does not start the job. Jobs that do not meet their deadline in this way count as failed jobs. 
# If this field is not specified, the jobs have no deadline.
startingDeadlineSeconds : 10

# optional. It specifies how to treat concurrent executions of a job that is created by this cron job. 
# The spec may specify only one of the following concurrency policies Allow , Forbid, Replace
concurrencyPolicy: Allow

# Optional. If it is set to true, all subsequent executions are suspended. 
# This setting does not apply to already started executions. Defaults to false.
suspend: true

# Optional. These fields specify how many completed and failed jobs should be kept
successfulJobsHistoryLimit: 3

# Restart policy for pod
restartPolicy: OnFailure

# The args to be passed to the container
args:
  - /bin/sh
  - -c
  - date; echo Hello from the Kubernetes cluster
```

## Work Queue
Run a Kubernetes Job with multiple parallel worker processes. Should be easy to us AMQP-type message service. In practice you could set up a message queue service once in a cluster and reuse it for many jobs, as well as for long-running services.

Use the work queue template 

```yml
# The completion count of the Job corresponds to the number of work items done.
completions: 8

# The number of parallel executions
parallelism: 2

# The AMQP broker URL
brokerUrl: amqp://guest:guest@rabbitmq-service:5672

# The jobs queue name
queue: jobs

# Restart policy for the POD
restartPolicy: OnFailure

# The back off limit if the job is retried
backoffLimit: 5

# The deadline in seconds for the job to complete.
# Note that a Job's .spec.activeDeadlineSeconds takes precedence over its .spec.backoffLimit. 
activeDeadlineSeconds: 100

# When the TTL controller cleans up the Job, 
# it will delete the Job cascadingly, i.e. delete its dependent objects, such as Pods, together with the Job. 
# Note that when the Job is deleted, its lifecycle guarantees, such as finalizers, will be honored.
ttlSecondsAfterFinished: 100
```

