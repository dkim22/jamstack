terraform {
  backend "s3" {
    bucket = "jamstack-terraform-dkim22"
    region = "ap-northeast-2"
    key = "state"
  }
}
