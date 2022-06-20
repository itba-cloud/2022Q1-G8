variable "name" {
  description = "The name of the SNS topic"
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean to indicate if FIFO topic"
  type        = bool
  default     = false
}

variable "subscriptions" {
  description = "List of subscriptions for the SNS topic. Subscription object has protocol and endpoint fields"
  type = list(object({
    protocol = string
    endpoint = string
  }))
  default = []
}