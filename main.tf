resource "aws_vpc" "testing" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "vpctesting"
        "Owner" = "Saeed"
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.testing.id
    cidr_block = "10.0.1.0/24"
    tags = {
      "Name" = "Testing_Subnet"
    }
}

resource "aws_instance" "server" {
    ami = var.myami
    instance_type = var.instype
    subnet_id = aws_subnet.subnet1.id
    tags = {
      "Name" = "webserver"
    }
}