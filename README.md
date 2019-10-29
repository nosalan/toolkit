# toolkit
Auxiliary docker image with tools like curl, bash, python, node, etc. 

The image works as non-root user.

By default it runs a nodejs http server that serves all files from the docker filesystem. This may be useful when the container/pod has Persistent Volume Claims attached which we want to access. 
If the container is deployed on Kubernetes use following command to foward traffic from/to http fileserver.
```
kubectl port-forward <pod-name> 8000:8000
```
and then open the browser at http://localhost:8000/ to see the files inside the container.

You may specify your own command in the Kubernetes deployment yaml or in the docker run command if run directly, for example, this command replaces default image command with custom (python3) command
```
sudo docker run --net=host -d --entrypoint=python3 nosalan/toolkit:latest -m http.server 8000
```

Use `nosalan/toolkit:latest` label to access the image.
