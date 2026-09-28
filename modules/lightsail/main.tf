# --- SSH Key Pair ---
resource "aws_lightsail_key_pair" "ls_ssh" {
  name = var.ssh_key_name
}

resource "aws_lightsail_instance" "ls_1" {
  name              = var.instance_name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  user_data         = var.user_data
  key_pair_name     = aws_lightsail_key_pair.ls_ssh.name
  tags              = var.tags

  lifecycle {
    # Only replace instance if these specific things change
    replace_triggered_by = []
    ignore_changes = [
      user_data # never replace instance just because user_data changed
    ]
  }
}

# --- Static IP ---
resource "aws_lightsail_static_ip" "ls_ip" {
  name = var.static_ip_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_lightsail_static_ip_attachment" "uptime_kuma" {
  static_ip_name = aws_lightsail_static_ip.ls_ip.name
  instance_name  = aws_lightsail_instance.ls_1.name

  lifecycle {
    replace_triggered_by = [
      aws_lightsail_instance.ls_1
    ]
    create_before_destroy = false
  }
}

# --- Firewall Rules ---
resource "aws_lightsail_instance_public_ports" "ls_fw" {
  instance_name = aws_lightsail_instance.ls_1.name

  port_info {
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidrs      = ["0.0.0.0/0"]
    ipv6_cidrs = []
  }

  port_info {
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidrs      = ["0.0.0.0/0"]
    ipv6_cidrs = []
  }

  port_info {
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidrs      = ["0.0.0.0/0"]
    ipv6_cidrs = []
  }
}

# Create the disk
resource "aws_lightsail_disk" "ls_disk" {
  name              = var.disk_name
  size_in_gb        = var.disk_size
  availability_zone = var.availability_zone

  lifecycle {
    prevent_destroy = true
  }
}

# Attach it to the instance
resource "aws_lightsail_disk_attachment" "ls_disk_attach" {
  disk_name     = aws_lightsail_disk.ls_disk.name
  instance_name = aws_lightsail_instance.ls_1.name
  disk_path     = "/dev/xvdf"

  lifecycle {
    replace_triggered_by = [
      aws_lightsail_instance.ls_1 # recreate when instance changes
    ]
    create_before_destroy = false
  }
}
