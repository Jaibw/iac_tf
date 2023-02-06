provider "aws" {
	region     = "REGION-NAME"
}

resource "aws_instance" "website01" {
	ami = "AMI-ID"
	instance_type = "t2.micro"
	associate_public_ip_address = "true"
	key_name = "AWS-KEY"
	user_data = <<EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo apt-get install -y git 
sudo rm -vrf /var/www/html
sudo git clone https://github.com/Jaibw/FrozenYogurtShop.git /var/www/html
sudo systemctl start nginx
sudo systemctl enable nginx
	EOF
	tags = {
		Name = "Website01"
	}
}
