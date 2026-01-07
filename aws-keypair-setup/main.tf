resource "tls_private_key" "devops_kp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "devops_kp_private_key" {
  filename        = "/home/bob/devops-kp.pem"
  content         = tls_private_key.devops_kp.private_key_pem
  file_permission = "0600"
}

resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_kp.public_key_openssh
}
