output "app1_development_vm" {
  description = "The ID of the target App1 Development virtual machine"
  value       = aws_instance.vm.id
}