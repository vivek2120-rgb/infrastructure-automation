terraform {
  backend "s3" {
    bucket         = "terraform-statefile-paraminfo"
    key            = "pihire/state"
    region         = "ap-south-1"
    
  }
}