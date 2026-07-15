resource "aws_lb" "this" {
  name               = "${var.project_template}-alb"
  internal           = var.lb_internal
  load_balancer_type = "application"
  enable_deletion_protection = true
  security_groups    = var.alb_sg_id
  subnets            =  var.subnets_alb
  tags = {
    Name        = "${var.project_template}-alb"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "${var.project_template}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = var.target_type
  health_check {
    path                = "/health.html"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}