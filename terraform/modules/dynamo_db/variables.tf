variable "table_name" {
  description = "Name of the table"
  type        = string
}

variable "read_capacity" {
  description = "Read capacity units of the table"
  type        = number
  default     = 10
}

variable "write_capacity" {
  description = "Write capacity units of the table"
  type        = number
  default     = 10
}

variable "hash_key" {
  description = "Hash key of the table"
  type        = string
}

variable "attribute" {
  description = "The hash_key attribute. It needs two fields: name and type"
  type = object({
    name = string
    type = string
  })
}