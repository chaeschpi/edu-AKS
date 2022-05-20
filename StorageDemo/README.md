# pvcdmeo

## Create Namespace 

```bash 
kubectl create namespace demo-pvc
```

## Create PVC 

```bash 
kubectl create -f pvc.yml
```

## Create Pod 

```bash 
kubectl create -f pod.yaml
````

## Add new File

```bash
 kubectl exec  pvc-pod -n demo-pvc -- bash -c "echo Hello World >> /var/log/nginx/test.txt
 ```
