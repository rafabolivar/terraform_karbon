# Nutanix Karbon Cluster using Terraform

This example shows how to create Kubernetes clusters with [Nutanix Karbon](https://www.nutanix.com/products/karbon), using infrastructure as code with [Terraform](https://www.terraform.io/)  and the [Nutanix Provider for Terraform](https://registry.terraform.io/providers/nutanix/nutanix/latest). 

For this purpose, I have developed a [Nutanix Calm](https://www.nutanix.com/products/calm) Blueprint, that automates the creation of a Workstation using an Ubuntu Cloud Image, and then installs Terraform, as well as the Nutanix Provider for Terraform, then it clones this GitHub repository, so everything is ready to deploy a new cluster in a matter of minutes. 

# Prerequisites

We'll need a working Nutanix cluster, with Nutanix Karbon enabled. 

## Required data

We need to know the following data about our environment:

 - Password for admin user
 - IP Address of your Prism Central and Prism Element 

# Deployment

Once you clone this GitHub repository, you have to import the blueprint located in the [blueprints](https://github.com/rafabolivar/terraform_karbon/tree/main/blueprints) folder, into your Calm environment. This can be easily done by clicking on the ***Blueprints*** icon on the left bar and selecting ***Upload Blueprint***. If you're asked for a password, use nutanix/4u.

Then you have to click the ***Launch*** button on the upper right side and change your Prism Central Password, Prism Central  and Prism Element IP Addresses. Then click ***Deploy***, and in a few minutes the Terraform Workstation will be up and running.

# Using Terraform to deploy a new K8s Cluster

## Login in the Terraform Workstation

Once the deployment is finished, you can login in the Terraform Workstation via SSH using the following credentials:

 - User: ubuntu
 - Password: nutanix/4u

## Karbon cluster deployment files

Inside the path `/home/ubuntu/terraform` you'll find the following 3 files:

|File|Description  |
|--|--|
|[main.tf](https://github.com/rafabolivar/terraform_karbon/blob/main/main.tf)  | The main configuration file for our deployment |
|[variables.tf](https://github.com/rafabolivar/terraform_karbon/blob/main/variables.tf)|The variable definition file|
|[terraform.tfvars](https://github.com/rafabolivar/terraform_karbon/blob/main/terraform.tfvars)  | The variable values that will be used in our deployment |

The variables values are autopopulated by Calm, using the appropiate values from our cluster.

**Important Note:** The network name used for this deployment is Primary. This value can be easily changed in the blueprint to match your requirements.

## Deploying the cluster

Once you have checked the content of the files, you can proceed deploying the Karbon Cluster. First you'll need to initialise the environment:

    ubuntu@ubuntu:~$ cd /home/ubuntu/terraform
    ubuntu@ubuntu:~/terraform$ ./terraform init
    
Then, you can check the plan for your deployment:

    ubuntu@ubuntu:~/terraform$ ./terraform plan
If you want to modify the files, later you can validate that they're correct:

    ubuntu@ubuntu:~/terraform$ ./terraform validate

Finally, you can launch your deployment:

    ubuntu@ubuntu:~/terraform$ ./terraform apply

Once you execute this command, you can check in Prism Central that a new Karbon Cluster is being deployed. By default, the name of the cluster will be ***rafak8s[UNIX_date]***. This can be easily modified editing the Terraform configuration files.

# Useful links

Here you have several links that can be useful to understand this example:

 - [Nutanix Terraform Provider example
   usage](https://registry.terraform.io/providers/nutanix/nutanix/latest/docs/resources/karbon_cluster).
 - [Nutanix Terraform Provider on   
   GitHub](https://github.com/nutanix/terraform-provider-nutanix).
 - [Nutanix Terraform Provider documentation and examples on   
   nutanix.dev](https://www.nutanix.dev/2021/04/20/using-the-nutanix-terraform-provider/).
 - [Aristocrat-B2B examples on   
   GitHub](https://github.com/Aristocrat-B2B/terraform-nutanix-karbon).
