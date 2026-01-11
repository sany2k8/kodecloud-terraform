resource "aws_instance" "nautilus_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "nautilus-instance"
  }
}

resource "aws_cloudwatch_metric_alarm" "nautilus_alarm" {
  alarm_name          = "nautilus-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU utilization exceeds 80%"
  dimensions = {
    InstanceId = aws_instance.nautilus_instance.id
  }
}
