variable "sub_id" {
  type        = string
  default     = "748173f1-20c4-4e68-ac58-641f67a83501"
}


# Wyłącznie dla celów zadaniowych, nie powinno się tak trzymać danych poufnych
variable "username" {
  type        = string
  default     = "admuser"
  sensitive   = true
}

# Wyłącznie dla celów zadaniowych, nie powinno się tak trzymać danych poufnych
variable "password" {
  type        = string
  default     = "rlystrongpass!123"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  default     = {
      owner = "UnknowOwner",
      start_date = "25.09.2021",
      course = "Terraform"
  }
}