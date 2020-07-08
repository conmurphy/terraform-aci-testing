terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "conmurphy-aci-demo"

    workspaces {
      name = "terraform-aci-testing"
    }
  }
}
