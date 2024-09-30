resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.bullz_vpc.id
  tags = {
    Name = "gw"
  }
}
