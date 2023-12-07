variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS Region"
}

variable "env" {
  type        = string
  default     = "development"
  description = "environment name"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0ca5c7b902c2c4559"
}

variable "az_subnet_mapping" {
  type = list(map(string))
  default = [
    { "us-east-2a" = "subnet-07b898558a212da68" },
    { "us-east-2a" = "subnet-0f5ea85d79f72065d" },
    { "us-east-2b" = "subnet-0383291eef43165a7" },
  ]
  description = "list of map of private / public subnets with respective az"
}

variable "allowed_inbound_ssh_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "list of cidrs to allow inbound ssh access from"
}

variable "allowed_inbound_client_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "list of cidrs to allow inbound client port (9092)"
}

variable "instance_type" {
  type        = string
  default     = "t3a.xlarge"
  description = "Instance Type"
}

variable "key_name" {
  type        = string
  default     = "kafka"
  description = "aws ec2 ssh key pair name"
}

variable "kafka_nodes" {
  type        = number
  default     = 3
  description = "how many nodes of kafka cluster is required?"
}

variable "kafka_volume_size" {
  type        = number
  default     = 30
  description = "how much size of kafka data volume is required?"
}

variable "kafka_root_volume_size" {
  type        = number
  default     = 10
  description = "how much size of kafka root volume is required?"
}

variable "kafka_ebs_attach_location" {
  type        = string
  default     = "/dev/sdc"
  description = "disk location in linux machine"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "do you want to assign public ip to kafka instances?"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be Added to All Resources, except Env & Name Tag"
  default = {
    "owner"    = "Terraform"
    "software" = "Apache Kafka"
  }
}
