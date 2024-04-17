/**
* Esse arquivo configura o backend para armazenar o estado em um bucket do S3.
*/
terraform {
  backend "s3" {
    bucket = "terraform-state-zoo"
    key    = "approval/terraform.tfstate"
    region = "us-west-2"
  }
}