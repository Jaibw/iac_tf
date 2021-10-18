provider "aws" {
	access_key = ""
    secret_key = ""
	region     = ""
}

resource "aws_instance" "website01-jai" {
	ami = ""
	instance_type = "t2.nano"
	associate_public_ip_address = "true"
	key_name = "tf"
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
		Name = "Website01-JAI"
	}
}
