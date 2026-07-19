resource "aws_subnet" "private_app" {

  count = length(local.azs)

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_app_subnet_cidrs[count.index]

  availability_zone = local.azs[count.index]

  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-private-app-${count.index + 1}"
      Tier = "Private-App"
    }
  )
}