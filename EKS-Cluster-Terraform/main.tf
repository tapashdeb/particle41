provider "aws"{
    region = "us-east-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0" 

  cidr= var.vpc_cidr
  public_subnets=var.public_subnets
  private_subnets=var.private_subnets
  azs=var.azs
  enable_nat_gateway=true
  single_nat_gateway=true
  enable_dns_support=true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  cluster_name= "particle41-cluster"
  cluster_version= 1.35
  cluster_endpoint_public_access = true
  vpc_id=module.vpc.vpc_id
  subnet_ids=module.vpc.private_subnets

   eks_managed_node_groups = {
    particle41={
        desired_size = 1
        min_size = 1
        max_size = 2
        instance_type=["m6a.large"]
        ami_type= "AL2_x86_64"
    }
  }
   cluster_addons = {
    codedns={}
    kube-proxy={}
   }
}