#Get latest amazon AMI
data "aws_ami" "amazon_linux" {
    most_recent = true

filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}

filter {
    name = "virtualization-type"
    values = ["hvm"]
}

    owners = ["amazon"]

}

resource "aws_instance" "my-ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"

    tags = {
        Name = "EC2-from-DataSource"
    }
}