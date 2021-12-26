# Sample app for Kubernetes

Deploy a simple container running Apache, using the image `quay.io/swains/httpd` based on `ubi8`.

```sh
kubectl apply -f https://raw.githubusercontent.com/sebw/kubernetes-sample-app/master/sample.yml
```

```sh
$ kubectl get all -n sampleapp
NAME                                        READY   STATUS    RESTARTS   AGE
pod/sampleapp-deployment-7f99699c69-dvhxx   1/1     Running   0          20s

NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/sampleapp-service   ClusterIP   10.43.101.243   <none>        80/TCP    20s

NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/sampleapp-deployment   1/1     1            1           20s

NAME                                              DESIRED   CURRENT   READY   AGE
replicaset.apps/sampleapp-deployment-7f99699c69   1         1         1       20s
```

```sh
# kubectl get ingress -n sampleapp
NAME                CLASS    HOSTS                   ADDRESS       PORTS   AGE
sampleapp-ingress   <none>   sampleapp.example.org   10.20.10.82   80      13m
```

```sh
curl -H "Host: sampleapp.example.org" http://your-kubernetes-node-ip
```
