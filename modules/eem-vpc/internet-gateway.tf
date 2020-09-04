resource "aws_internet_gateway" "eem-internet-gateway" {
  vpc_id = aws_vpc.eem-vpc.id

  tags = {
    Name  = "eem-internet-gateway"
  }
}