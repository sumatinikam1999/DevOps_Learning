variable "ami" {
  type        = string
  description = "we are providing value for ami_id"
}

variable "instance_type" {
  type        = string
  description = "we are providing value for instance_type"
}

variable "instance_names" {
  type        = list(string)
  description = "instance names"
  default     = ["mysql", "mongodb", "user", "cart"]
}
