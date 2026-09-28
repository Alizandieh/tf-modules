variable "ssh_key_name" {
  description = "Name of the Lightsail SSH key pair"
  type        = string
}

variable "instance_name" {
  description = "Name of the Lightsail instance"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone where the instance will be created"
  type        = string
}

variable "blueprint_id" {
  description = "Lightsail blueprint ID (OS/application image)"
  type        = string
}

variable "bundle_id" {
  description = "Lightsail bundle ID (instance plan/specification)"
  type        = string
}

variable "user_data" {
  description = "User data script to run during instance initialization"
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the Lightsail instance"
  type        = map(string)
  default     = {}
}

variable "static_ip_name" {
  description = "Name of the Lightsail static IP"
  type        = string
}

variable "disk_name" {
  description = "Name of the Lightsail disk"
  type        = string
}

variable "disk_size" {
  description = "Size of the Lightsail disk in GB"
  type        = number
}
