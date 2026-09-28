variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cert_manager_role" {
  description = "Whether to create IAM resources for cert-manager"
  type        = bool
  default     = false
}

variable "external_dns_role" {
  description = "Whether to create IAM resources for External DNS"
  type        = bool
  default     = false
}

variable "external_secrets_role" {
  description = "Whether to create IAM resources for External Secrets"
  type        = bool
  default     = false
}

variable "loki_s3_role" {
  description = "Whether to create IAM role for Loki"
  type        = bool
  default     = false
}

variable "grafana_role" {
  description = "Whether to create IAM role for Grafana CloudWatch data source"
  type        = bool
  default     = false
}

variable "loki_chunks_bucket_name" {
  description = "The bucket created for Loki chunks"
  type        = string
  default     = ""
}

variable "loki_ruler_bucket_name" {
  description = "The bucket created for Loki ruler"
  type        = string
  default     = ""
}

variable "saha_s3_role" {
  description = "Whether to create IAM role for Bridge backend"
  type        = bool
  default     = false
}

variable "saha_namespace" {
  description = "The K8s namespace where the Bridge application is deployed"
  type        = string
  default     = ""
}

variable "saha_bucket_name" {
  description = "The Bridge application s3 bucket"
  type        = string
  default     = ""
}

variable "karpenter_role" {
  description = "Whether to create IAM resources for Karpenter"
  type        = bool
  default     = false
}

variable "velero_role" {
  description = "Whether to create IAM role for Velero"
  type        = bool
  default     = false
}

variable "velero_bucket_name" {
  description = "The Velero bucket for backups"
  type        = string
  default     = ""
}
