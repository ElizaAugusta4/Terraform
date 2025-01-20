module "meu_ec2" {
  source        = "./modules/"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket = "bucket-terraform-statess"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}