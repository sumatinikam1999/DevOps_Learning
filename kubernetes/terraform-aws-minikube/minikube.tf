module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "my-minikube"
  aws_instance_type = "t2.medium"
  ssh_public_key = "~/.ssh/id_rsa.pub"
  aws_subnet_id = "subnet-8a3517f8"
  ami_image_id = "ami-b81dbfc5"
  hosted_zone = "my-domain.com"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-dashabord/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-metrics-server/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-nginx-ingress/init.sh"
  ]
}