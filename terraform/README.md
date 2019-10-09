# Terraform

Terraform is a tool to enable Infrastructure as Code to provision and manage
any cloud, infrastructure or service.

## Azure

Before running any of the command below, make sure that the dependencies is already installed:

1. Install the azure-cli shell command. See [this page](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).
2. Install the terraform shell command. See [this page](https://learn.hashicorp.com/terraform/getting-started/install.html).


### Deploy new Azure Kubernetes Service (AKS)

First, define some variable:

```bash
export TF_VAR_ssh_public_key=/path/to/your/ssh/publickey
export TF_VAR_client_id=${CLIENT_ID}
export TF_VAR_client_secret=${CLIENT_SECRET}
```

Replace `CLIENT_ID` and `CLIENT_SECRET` with values generated using `azure-cli`
tool as described [here](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html)

Now we are ready to deploy an Azure Kubernetes cluster using Terraform.

```bash
# change to the directory where terraform config files located
$ cd azure/deploy-cluster

$ terraform init
[...]

$ terraform plan -out out.plan
[...]

$ terraform apply "out.plan"
[...]

# Wait until cluster finished deploying
```

**NOTE**: remember to delete your Kubernetes cluster afterward! We don't want to
be charged :)

Based on [1](https://www.hashicorp.com/blog/kubernetes-cluster-with-aks-and-terraform)
and [2](https://github.com/hashicorp/terraform-guides/tree/master/infrastructure-as-code/k8s-cluster-aks)