#! /bin/bash

kubectl delete job node-app-job

kubectl apply -f node-app-job.yaml