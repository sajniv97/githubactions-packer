variable "project" {
  type    = string
  default = "shopping"
}

variable "env" {
  type    = string
  default = "production"
}

locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image-name      = "${var.project}-${var.env}-${local.image-timestamp}"
}

variable "ami" {
  default = "ami-02e94b011299ef128"
}

