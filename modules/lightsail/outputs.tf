output "static_ip" {
  value = aws_lightsail_static_ip.ls_ip.ip_address
}

output "ssh_public_key" {
  description = "Public key of the Lightsail SSH key pair"
  value       = aws_lightsail_key_pair.ls_ssh.public_key
}

output "ssh_private_key" {
  description = "Private key of the Lightsail SSH key pair"
  value       = aws_lightsail_key_pair.ls_ssh.private_key
}
