output "instance_id" { 
description = "This is the ID of the EC2 instance"
value = aws_instance.copilot_instance.id 
}
