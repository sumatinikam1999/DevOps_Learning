resource "aws_instance" "conditions" {
  count = 4
  ami   = var.ami
  tags = {
    Name = var.instance_names[count.index]
  }

  instance_type = (
    var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "mongodb" ? "t3.micro" : "t2.micro"
  )
}
