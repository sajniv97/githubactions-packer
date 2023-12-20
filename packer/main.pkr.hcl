source "amazon-ebs" "image" {

ami_name = local.image-name
source_ami = var.ami
instance_type = "t2.micro"
ssh_username = "ec2-user"
tags = {
  Name = local.image-name
  project = var.project
  env = var.env
}
}

build {

sources = ["source.amazon-ebs.image"]

provisioner "file" {
source = "../website"
destination = "/tmp/"
}


provisioner "shell" {
script = "./setup.sh"
execute_command = "sudo {{.Path}}"
}
}
