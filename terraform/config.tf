terraform {
  backend "s3" {
    #bucket = "azure-devops-terraform-aci-demo-s3-bucket"
    key    = "terraform.tfstate"
    #region = "eu-central-1"
  }
}

#configure provider with your cisco aci credentials.
provider "aci" {
  username = "${var.apic_username}"
  password = "${var.apic_password}"
  url      =  "${var.apic_url}"
  insecure = true
}

resource "aci_tenant" "myTenant" {
  name        = "conmurph_azure_devops"    
}

resource "aci_bridge_domain" "bd_for_subnet" {
  tenant_dn   = "${aci_tenant.myTenant.id}"
  name        = "bd_for_subnet"
  description = "This bridge domain is created by the Terraform ACI provider"
}

resource "aci_subnet" "demosubnet" {
  parent_dn                    = "${aci_bridge_domain.bd_for_subnet.id}"
  ip                                  = "172.16.1.1/24"
  scope                               = "private"
  description                         = "This subject is created by Terraform v3"
}





