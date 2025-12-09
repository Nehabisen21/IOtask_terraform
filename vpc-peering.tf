resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true
}

resource "aws_route" "vpc1private_to_vpc2" {
  route_table_id            = aws_route_table.vpc1_private_rt.id #vcp1 private subnet can communicate with vpc2
  destination_cidr_block    = var.vpc2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "vpc2private_to_vpc1" {
  route_table_id            = aws_route_table.vpc2_private_rt.id #vpc2 private subnet can communicate with vpc1
  destination_cidr_block    = var.vpc1_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

