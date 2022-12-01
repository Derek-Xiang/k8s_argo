variable "region" {
  type    = string
  default = "australia-southeast2"
}

variable "zone" {
  type    = string
  default = "australia-southeast2-b"
}

variable "cluster_info" {
  type = object({
    name = string
  })
  default = {
    name = "kube-cluster"
  }
}

variable "svc_account_config" {
  type = object({
    account_id   = string
    display_name = string
  })
  default = {
    account_id   = "kube-demo"
    display_name = "kube-demo"
  }
}
