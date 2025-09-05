module "minikube" {
  source = "github.com/sumatinikam1999/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "my-minikube"
  aws_instance_type = "t3.medium"
  # ~ means home dir
  ssh_public_key = "ssh-keys/id_rsa.pub"
  aws_subnet_id = "subnet-0201394cf86be363d" #any-public-subnet
  hosted_zone = "devopslearner.space"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
      "https://raw.githubusercontent.com/sumatinikam1999/terraform-aws-minikube/master/addons/kubernetes-dashabord/init.sh",
      "https://raw.githubusercontent.com/sumatinikam1999/terraform-aws-minikube/master/addons/kubernetes-metrics-server/init.sh",
      "https://raw.githubusercontent.com/sumatinikam1999/terraform-aws-minikube/master/addons/external-dns/init.sh",
      "https://raw.githubusercontent.com/sumatinikam1999/terraform-aws-minikube/master/addons/kubernetes-nginx-ingress/init.sh"
  ]
}