terraform {
  backend "s3" {
    bucket          = "project-bedrock-tfstate-alt-soe-tin-025-0324" # Choose a globally unique name
    key             = "eks-russian-tutorial/terraform.tfstate"   # Where the file lives in the bucket
    region          = "us-east-1"                                # Your AWS region (e.g., us-west-2)
    use_lockfile = true                                       # Prevents two people from running apply at once
    encrypt         = true                                       # Encrypts the state file for security
  }
}
