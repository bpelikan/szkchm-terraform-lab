variable "sub_id" {
  type        = string
  default     = "748173f1-20c4-4e68-ac58-641f67a83501"
}

variable "app_names" {
  type        = set(string)
  default     = [
      "bp-super-app",
      "bp-friends-share",
      "bp-notebook-app"
  ]
}
