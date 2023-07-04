# Copyright 2022 Google LLC. This software is provided as is, without warranty 
# or representation for any use or purpose. 
# Your use of it is subject to your agreement with Google.

variable "project_id" {
  description = "Specify the Project ID where deployment is to be made"
  type        = string
}
variable "region_id" {
  description = "Specify the Region ID where the deployment is to be made"
  type        = string
}
variable "auth_file" {
  description = "Specify the service account json path to be used for the execution"
  type        = string
}
variable "deploy_env" {
  description = "Specify the environment for the execution"
  type        = string
}
variable "deploy_type" {
  description = "Specify deploy type: 'All'-> for complete deployment & 'Diff'-> for incremental/release based deployment"
  type        = string
}
variable "ins_list_path" {
  description = "Specify path where the instance master list is present"
  type        = string
}