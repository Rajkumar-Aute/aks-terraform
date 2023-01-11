variable "commonname" {
  type        = string
  description = "Common Name"
  default     = "akstest"

}

variable "mode" {
  type    = string
  default = "terraform"

}

variable "team_name" {
  type    = string
  default = "rteam"

}

variable "resource_group_name" {
  type        = string
  description = "Resource Group for the ACR"
  default     = "aksrg"
}

variable "aks_cluster_name" {
  type    = string
  default = "akscluster"

}
variable "aks_name" {
  type        = string
  description = "AKS name"
  default     = "aks"
}

variable "location" {
  type        = string
  description = "Resource group location"
  default     = "North Europe"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"

}

variable "ssh_public_key" {
  description = "SSH Public key for AKS Cluster"
  default     = "./ssh/aks.pub"

}

variable "windows_admin_username" {
  type        = string
  description = "admin username"
  default     = "aksadmin"
  
}

variable "windows_admin_password" {
  type        = string
  description = "ask admin password"
  #default     = "AKSAdminP@55"
  default     = "AKSAdmininistratorP@55"

}

variable "cidrrange" {
  type = string
  description = "CIDR Range for AKS Cluster"
  default = "10.0.0.0/8"
  
}

variable "subnet" {
  type = string
  description = "Subnet for aks"
  default = "10.10.0.0/16"
  
}