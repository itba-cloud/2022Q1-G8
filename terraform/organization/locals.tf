locals {
  path = "../resources"
}

locals {
  bucket_name = "website-grupo8-20221c-itba-cloud-computing"
  s3 = {
    static_website = {
      # 1 - Website
      website = {
        bucket_name = local.bucket_name
        path        = "../resources"

        website = {
          index_document = "index.html"
          error_document = "error.html"
        }

        objects = {
          index = {
            filename     = "html/index.html"
            content_type = "text/html"
          }
          error = {
            filename     = "html/error.html"
            content_type = "text/html"
          }
          image1 = {
            filename     = "images/image1.png"
            content_type = "image/png"
          }
          image2 = {
            filename     = "images/image2.jpg"
            content_type = "image/jpeg"
          }
        }
      }

      # 2 - WWW Website
      www-website = {
        bucket_name = "www.${local.bucket_name}"
        website = {
          redirect_all_requests_to = {
            protocol  = "http"
            host_name = "${local.bucket_name}.s3-website-${data.aws_region.current.name}.amazonaws.com"
          }
        }
      }
    }

    #3 - Logs
    logs = {
      bucket_name = "logs-${local.bucket_name}"
      acl         = "log-delivery-write"
    }
  }
}

locals {
  vpc_name                  = "grupo-8-vpc"
  vpc_cidr_block            = "10.0.0.0/16"
  vpc_private_subnet_name   = "grupo-8-private-subnet-vpc"
  private_subnet_cidr_block = "10.0.1.0/24"
}

locals {
  vpc_endpoint_services = {
    dynamodb = {
      service       = "com.amazonaws.us-east-1.dynamodb"
      endpoint_type = "Gateway"
    }
    s3 = {
      service       = "com.amazonaws.us-east-1.s3"
      endpoint_type = "Gateway"
    }
    sns = {
      service       = "com.amazonaws.us-east-1.sns"
      endpoint_type = "Interface"
    }
  }
}

locals {
  sns_topics = {
    alarms = {
      name = "sns-alarms"
      subscriptions = [
        {
          protocol = "email"
          endpoint = "testcloudgrupo8@yopmail.com"
        }
      ]
    }
  }
}