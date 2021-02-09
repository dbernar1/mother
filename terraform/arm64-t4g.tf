provider "aws" {
  profile = "default"
  region  = "ca-central-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "dan-dev" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t4g.micro"
  key_name        = "bwah-key"
  security_groups = ["default", "dan-dev"]
}

resource "aws_key_pair" "bwah" {
  key_name   = "bwah-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCBVfC5ynbR6S7hgVe/y3urWoxcK59SEztVu4U9SsJoTT1dF175cRZkoyPnMValGTO9hhp4q/6xHyeUiaKoSGWtzx5WW58+YV+Gdyck0XnrHC0WcpC8i9q0jTA6oEOyH+FXlnQp6Ym7CpiZauc9xb3m8Ybg3aa6Ds/pUV0TP+FK5p6hLMMk++dtpDTr34wwaBH/nL7DPIRybWsWxBxPRRv6w5T02CToi9NSWzgucRdbj1ER7/GEgRyjL3spM/DWhYxwgbhwBPdWwr12/KqxcvAFeN4jrwoblKyZNckvdG9UYADeopYJ8oGYM4VZrC5PrOA4nT60uzGUnMT95yBx7vox"
}
