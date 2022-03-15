variable "aws_region" {
    description = "The AWS region to target"
    type = string
    default = "us-east-1"
}

variable "sdlc_environment" {
    description = "The target SDLC environment"
    type = string
    default = "Development"
    validation {
        condition = can(index(["Development", "Staging", "Production"], var.sdlc_environment) >= 0)
        error_message = "The SDLC environment must be \"Development\", \"Staging\" or \"Production\"."
    }
}

variable "secret_value" {
    description = "The Secret Value"
    type = string
    sensitive = true
    default = "mysecret"
}
