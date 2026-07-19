resource "aws_subnet" "private_db" {

  for_each = local.private_db_subnets

  vpc_id = aws_vpc.this.id

  availability_zone = each.key

  cidr_block = each.value

  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-private-db-${each.key}"
      Tier = "Private-DB"
    }
  )
}