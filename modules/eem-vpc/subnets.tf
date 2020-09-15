resource "aws_subnet" "eem-public-subnet-a" {
    vpc_id     = aws_vpc.eem-vpc.id
    availability_zone = "us-east-1a"
    cidr_block = cidrsubnet(aws_vpc.eem-vpc.cidr_block, 4, 0)
    map_public_ip_on_launch="true"

    tags = {
        Name = "eem-public-subnet-a"
    }
}

resource "aws_subnet" "eem-public-subnet-b" {
    vpc_id     = aws_vpc.eem-vpc.id
    availability_zone = "us-east-1b"
    cidr_block = cidrsubnet(aws_vpc.eem-vpc.cidr_block, 4, 1)
    map_public_ip_on_launch="true"

    tags = {
        Name = "eem-public-subnet-b"
    }
}

resource "aws_subnet" "eem-public-subnet-c" {
    vpc_id     = aws_vpc.eem-vpc.id
    availability_zone = "us-east-1c"
    cidr_block = cidrsubnet(aws_vpc.eem-vpc.cidr_block, 4, 2)
    map_public_ip_on_launch="true"

    tags = {
        Name = "eem-public-subnet-c"
    }
}
