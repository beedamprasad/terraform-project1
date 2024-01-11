resource "aws_elb" "bar" {
  name               = "Prasad-terraform-elb"
  availability_zones = ["ap-south-1", "ap-south-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                 = ["${aws_instance.one.id}", "${aws_instance.two.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {
    Name = "prasad-tf-elb"
  }
}

/*resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  availability_zones      = ["ap-south-1", "ap-south-1b"]
  database_name           = "mydb"
  master_username         = "Prasad
  master_password         = "Prasad#444555"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}*/

/*resource "aws_instance" "one" {
  for_each = toset(["one", "two", "three"])
  ami           = "ami-0c84181f02b974bc3"
  instance_type = "t2.micro"
  tags = {
    Name = "instance-${each.key}"
  }
}
*/
