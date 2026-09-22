# Generate or Update the Context from AWS
Run the following AWS CLI command to automatically fetch the cluster details and inject the context into your ~/.kube/config file:
#
```bash
aws eks update-kubeconfig --region us-east-2 --name staging-demo

kubectl config get-contexts

kubectl config use-context <context-name>

kubectl config view --minify
```

#
# Step 3: Verify You Are Pointed to the Right Place
Run a quick test command to ensure kubectl is communicating with your current EKS cluster:
#
```bash
kubectl cluster-info
```
#

# EKS USER ACCESS
``` kubectl apply -f 1-example
```

# CREATED A MANAGER
after creating a manager, you cancheck to see if its properly configured by attempting to assume a role

```bash
aws sts assume-role \
--role-arn arn:aws:iam::943088191357:role/staging-demo-eks-admin \
--role-session-name manager-session \
--profile manager


kubectl get pods -n kube-system

kubectl logs -l app.kubernetes.io/instance=metrics-server -f -n kube-system

# CHECK POD METRICS
kubectl top pods -n kube-system

#  You can port forward a Cluster IP using this command
kubectl port-forward svc/myapp 8080 -n -3-example

#4. CLUSTER AUTOSCALER AND EKS POD IDENTITY
aws eks describe-addon-versions --region us-east-2 --addon-name eks-pod-identity-agent
kubectl get pods -n kube-system
kubectl get daemonset eks-pod-identity-agent -n kube-system 
# (without the agent running you wont e able to auth your client with aws service)
