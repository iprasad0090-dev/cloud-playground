resource "aws_subnet" "public" {

  for_each = local.public_subnets

  vpc_id = aws_vpc.this.id

  availability_zone = each.key

  cidr_block = each.value

  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-public-${each.key}"
      Tier = "Public"
    }
  )
}