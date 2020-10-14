#configure provider with your cisco aci credentials.
provider "aci" {
  # cisco-aci user name
  username = "${var.username}"
  # cisco-aci password
  password = "${var.password}"
  # cisco-aci url
  url      =  "${var.apic_url}"
  insecure = true
}


# data "aci_tenant" "my_shared_tenant" {
#  name = "my_shared_tenant"
#}

#data "aci_bridge_domain" "my_shared_bd" {
#  tenant_dn   = "${data.aci_tenant.my_shared_tenant.id}"
#  name        = "my_shared_bd"
#}


resource "aci_tenant" "my_terraform_tenant" {
  name        = "my_terraform_tenant"    
  description = "This tenant is created by the Terraform ACI provider"
}

resource "aci_tenant" "myTenant" {
  name        = "myTenant"    
}

resource "aci_bridge_domain" "bd_for_subnet" {
  tenant_dn   = "${aci_tenant.myTenant.id}"
  name        = "bd_for_subnet"
  description = "This bridge domain is created by the Terraform ACI provider"
}

resource "aci_subnet" "demosubnet" {
  bridge_domain_dn                    = "${aci_bridge_domain.bd_for_subnet.id}"
  ip                                  = "172.16.1.1/24"
  scope                               = "private"
  description                         = "This subject is created by Terraform"
}





