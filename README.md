# Kubernetes

- Need to run `minikube tunnel` to access the service

- All scripts are intended to be executed from their directories.
This significantly simplifies the scripts, keeping them more maintainable

- `LoadBalancer` service types are used alongside `minikube tunnel` in order to
bind the localhost `8090` and `8080` ports (also works with WSL2). `NodePort` service
type restricts me to use the port range `30000-32767` to access the services from the
browser

- Jenkins reference (https://www.jenkins.io/doc/book/installing/kubernetes/#install-jenkins-with-yaml-files)

# Terraform

- Instance access is made without ssh keys. It uses AWS SSM Session Manager
