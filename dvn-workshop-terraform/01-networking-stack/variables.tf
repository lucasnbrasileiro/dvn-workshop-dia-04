variable "tags" {
  type = map(string)
  default = {
    Project     = "workshop-devops-na-nuvem"
    Environment = "production"
  }
}

variable "auth" {
  type = object({
    assume_role_arn = string
    region          = string
  })

  default = {
    assume_role_arn = "arn:aws:iam::654654554686:role/workshop-role"
    region          = "us-west-1"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    name                     = "workshop-devops-na-nuvem-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "workshop-devops-na-nuvem-internet-gateway"
    nat_gateway_name         = "workshop-devops-na-nuvem-nat-gateway"
    public_route_table_name  = "workshop-devops-na-nuvem-public-route-table"
    private_route_table_name = "workshop-devops-na-nuvem-private-route-table"
    public_subnets = [{
      name                    = "workshop-devops-na-nuvem-vpc-public-subnet-1a"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "us-west-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "workshop-devops-na-nuvem-vpc-public-subnet-1c"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-west-1c"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "workshop-devops-na-nuvem-vpc-private-subnet-1a"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "us-west-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "workshop-devops-na-nuvem-vpc-private-subnet-1c"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-west-1c"
        map_public_ip_on_launch = false
    }]
  }
}
