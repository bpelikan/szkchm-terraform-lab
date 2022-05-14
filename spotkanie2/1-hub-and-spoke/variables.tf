variable "sub_id" {
  type    = string
  default = "748173f1-20c4-4e68-ac58-641f67a83501"
}


# Wyłącznie dla celów zadaniowych
variable "username" {
  type      = string
  default   = "admuser"
  sensitive = true
}

# Wyłącznie dla celów zadaniowych
variable "password" {
  type = string
  # default = "rlystrongpass!123"
  default   = "Testtest123!@#"
  sensitive = true
}