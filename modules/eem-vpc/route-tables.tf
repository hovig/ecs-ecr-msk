resource "aws_route_table" "eem-public-route-table" {
  vpc_id = aws_vpc.eem-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eem-internet-gateway.id
  }

  tags = {
    Name = "eem-public-route-table"
  }
}

resource "aws_route_table_association" "eem-public-route-table-public-subnet-a" {
  subnet_id      = aws_subnet.eem-public-subnet-a.id
  route_table_id = aws_route_table.eem-public-route-table.id
}

resource "aws_route_table_association" "eem-public-route-table-public-subnet-b" {
  subnet_id      = aws_subnet.eem-public-subnet-b.id
  route_table_id = aws_route_table.eem-public-route-table.id
}

resource "aws_route_table_association" "eem-public-route-table-public-subnet-c" {
  subnet_id      = aws_subnet.eem-public-subnet-c.id
  route_table_id = aws_route_table.eem-public-route-table.id
}