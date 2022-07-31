terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
  }
}
#https://blog.cloudthat.com/create-aws-lifecycle-policy-using-terraform-for-taking-ebs-snapshots/
provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA5NT4NKRV7253UH7V"
  secret_key = "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"

}
