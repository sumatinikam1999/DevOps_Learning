# resource "aws_instance" "conditions" {
#   count         = 4
#   ami           = var.ami
#   instance_type = var.instance_type
#   tags = {
#     Name = "MyEC2-${count.index}"
#   }
# }
