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

Once you clone this GitHub repository, you have to import the blueprint under the blueprints folder, into your Calm environment. This can be easily done by
