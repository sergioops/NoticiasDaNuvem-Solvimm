resource "aws_elastic_beanstalk_application" "wpnvapp" {
  name        = "wpnvapp"
  description = "wpnvapp"
}

resource "aws_elastic_beanstalk_environment" "wpnv_env" {
  name                = "wpnvenv"
  application         = aws_elastic_beanstalk_application.wpnvapp.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.1 running PHP 8.1"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = aws_vpc.wpnv-vpc.id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${aws_subnet.wpnv-private-app-us-east-1a.id},${aws_subnet.wpnv-private-app-us-east-1b.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${aws_subnet.wpnv-public-us-east-1a.id},${aws_subnet.wpnv-public-us-east-1b.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "DBSubnets"
    value     = "${aws_subnet.wpnv-private-data-us-east-1a.id},${aws_subnet.wpnv-private-data-us-east-1b.id}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "Any 2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "20"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.small,t3.large"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    value     = "30"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = "CPUUtilization"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = "Percent"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = "Percent"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    value     = "60"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t3.small,t3.large"
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "SupportedArchitectures"
    value     = "x86_64"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBInstanceClass"
    value     = "db.m6i.xlarge"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "MultiAZDatabase"
    value     = "true"
  }


}