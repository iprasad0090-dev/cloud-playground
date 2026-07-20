resource "aws_route_table_association" "public" {

  for_each = aws_subnet.public

  subnet_id = each.value.id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_app" {

  for_each = aws_subnet.private_app

  subnet_id = each.value.id

  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_db" {

  for_each = aws_subnet.private_db

  subnet_id = each.value.id

  route_table_id = aws_route_table.database.id
}