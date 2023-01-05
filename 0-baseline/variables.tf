variable "org_id" {
  description = "The id of the organization"
  type        = string
}

variable "billing_account_id" {
  type = string
}

variable "project_prefix" {
  type = string
}

variable "parent_folder" {
  type        = string
  description = "Parent folder to be used to create all resources (including additional folders)."
  nullable    = false
  validation {
    condition     = can(regex("(^[0-9A-z-_.]+$)", var.parent_folder))
    error_message = "Parent folder ID may only contain alphanumeric characters, numbers, dash, dot and underscore."
  }
}

variable "org" {
  description = "tuples of parent with a list of folder childs"
  type = map
}