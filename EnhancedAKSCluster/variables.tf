variable "acrName" {
  type = string
  default = "acrdemoeuw9986"
}
variable "acrId" {
    type = string
    default = "/subscriptions/beb82784-53ff-46c5-bd24-e96118a63038/resourceGroups/rg-acr-euw/providers/Microsoft.ContainerRegistry/registries/acrdemoeuw9986"
  
}

variable "acrRgName" {
  
  type = string
  default = "rg-acr-euw"
}

variable "vnetIpRange" {
  type = string
  default = "192.168.0.0/23"
}
variable "snetIpRangeAks" {
  type = string
  default = "192.168.0.0/24"
}
variable "snetIpRangeAppGw" {
  type = string
  default = "192.168.1.0/24"
}

variable "ssh_public_key" {
  type = string 
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD0kgPR+cnow6zvO7g9gveCgszcZ2Z7O2QjRaNCEYujmFROMWQFrGF+oQRunvl2OGFFrTJxQNuoXCBB4eKZ/pCPWOGGjW8jkOUkMrA4jYbA/U+7xxPynT/inLibQnkIlCcqIDktv5QDrZJBzxqJgGiyErS6M5RSa//XInbp9CaD9KCS/TQaw+POP2zdCB7LLw6Vzt+N4YMHnYz0jP+jZp9NNviDvk82q5yUan2Ug9tp7pxb2CKJnmBJNp3zsvPoBac0bdAlhWS8fIIUR7pcTqgnFZfw8pHCeaoAjTYl07UHAQoC1cP/An1sUIKKb34mkPXWqRKcNKcYBo5mKuYgUD7LWg7Wfe35+G2c4ja1V7s+SZ+sRWfK83hy6cK+OtfbSfzDgZbnie0bkICYTFcV5KyzdcUJt5Nl52KogpSM7CQeWLED0uahnF/Rb83ZuXIaXbAEihor+kfXGpR2u5nPDUjX8c6af3kSCsEYxcPI776Hm55opDFzZrIdKRCm0uzC5lFAM3UWwXyJIt8H/9JVNXNH5r+u7mDSvRfvopsYrRGWCRwx46LIF2a1PL3x7c9GFL59OBPz4nMh999fWh40cJnHSBfJxXxuy/Nj/6ICESh7EPst2Udq0lvOM6w361WeTUrj7IXh1fIrG0V/KFCmHT25o7W/DYCqE949+kn/j8+ERQ== daniel@ws786"
}

variable "kubernetes_version" {
  type = string 
  default = "1.22.6"
}

variable "agent_count" {
  type = number
  default = 3
}

variable "vm_size" {
  type = string 
  default = "Standard_DS2_v2"
  
}