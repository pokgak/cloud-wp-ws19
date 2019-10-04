variable "client_id" {}

variable "client_secret" {}

variable "agent_count" {
  default = 1
}

variable "ssh_public_key" {
}

variable "dns_prefix" {
  default = "clouddrop"
}

variable cluster_name {
  default = "clouddrop-cluster"
}

variable resource_group_name {
  default = "nic-clouddrop"
}

variable location {
  default = "France Central"
}

variable k8s_version {
    default = "1.13.10"
}
