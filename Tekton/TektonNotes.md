# Tekton Notes

```
Tekton:
 - K8s native open-source framework for creating Continuous Delivery (CD) systems.
```

### Step
- Step = Container
- A step is the smallesrt unit.
- step:
    - name: We name the step to identify what it's doing.
    - image: image we want to pull
    - env: we define the environment which is accessible to the container
    - script: we write a script which is invoked as if it was stored inside the  container image

```yaml
steps:
    - name: deploy-app
      image: <image that we want to pull>
      env:
        - name: API_KEY
          valueFrom:
                secretKeyRef:
                    name: secure-properties
                    key: apikey
      script: |
            cloud login -a $(params.api-url)

```

### Task
- Task = Pod
- A Task is a sequence of steps running a sequence of containers.
- All steps in the Task have access to a shared workspace, which is mounted to the port as an implicit volume.
- A Task is executed using a TaskRun, which provides the parameters and other resources needed by the Task.


### Pipeline
- A Tekton pipeline is a collection of Tekton tasks running a set of Kubernetes pods.
- A pipeline receives input through parameters & produce outputs through results.
- Tests in a pipeline share data through results & workspaces.
- If the data to be shared among tasks is small, it can be written as a result.
- If the data to be shared among tasks is large, it can be written to a workspace, which is a shared Persistent Volume Claim (PVC).
- A pipeline is exucuted using a PipelineRun.

## How to work with Tekton
- To work with Tekton you must have a `Kubernetes cluster` up and running and `kubectl` properly configured to issue commands to your cluster. (ie: Minikube for locally)

- Then, you need to install Tekton Pipelines using the command below.
```bash
kubectl apply --filename \
https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml


- To monitor the installation run:
kubectl get pods -n tekton-pipelines --watch
```

- If you want to check the task log, run the following command:
```
kubectl logs --selector=tekton.dev/taskRun=<taskRun-name>
```

---

```bash
- To apply task, taskRun, pipeline, pipelineRun
$ kubectl apply -f <file-name.yml>

- To view Task, TaskRun, Pipeline & PipelineRun
$ kubectl get task
$ kubectl get taskrun
$ kubectl get pipeline
$ kubectl get pipelinerun


- To delete task, taskRun, pipeline & pipelineRun
$ kubectl delete task <task-name>
$ kubectl delete taskrun <taskRun-name>
```

