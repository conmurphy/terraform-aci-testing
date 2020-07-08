#configure provider with your cisco aci credentials.
provider "aci" {
  # cisco-aci user name
  username = "${var.username}"
  # cisco-aci password
  password = "${var.password}"
  # cisco-aci url
  url      =  "${var.url}"
  insecure = true
}


resource "aci_tenant" "terraform_tenant" {
  name        = "tenant_for_terraform"
  description = "This tenant is created by the Terraform ACI provider"
}

resource "aci_bridge_domain" "bd_for_subnet" {
  tenant_dn   = "${aci_tenant.terraform_tenant.id}"
  name        = "bd_for_subnet"
  description = "This bridge domain is created by the Terraform ACI provider"
}

resource "aci_subnet" "demosubnet" {
  bridge_domain_dn                    = "${aci_bridge_domain.bd_for_subnet.id}"
  ip                                  = "10.1.1.2/24"
  scope                               = "private"
  description                         = "This subject is created by Terraform"
}

variable "url" {}
variable "username" {}
variable "password" {}