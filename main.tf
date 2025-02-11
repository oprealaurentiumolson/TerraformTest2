module "aws_reverse_proxy" {
  # Available inputs: 
  # Check for updates: https://github.com/futurice/terraform-utils/compare/v11.0...master
  # source = "github.com/somleng/terraform-aws-cloudfront-reverse-proxy"

source = "github.com/somleng/terraform-aws-cloudfront-reverse-proxy"



  # Somewhat perplexingly, this is the "correct" way to ensure users can't bypass CloudFront on their way to S3 resources
  # https://abridge2devnull.com/posts/2018/01/restricting-access-to-a-cloudfront-s3-website-origin/

host = "your-domain.example.com"
  origin = "your-domain.app.somleng.org"
  zone_id = aws_route53_zone.example_com.zone_id # Optional. Leave blank if not using route53.
  certificate_arn = "existing-certificate-arn" # Optional. Leave blank to create a new certificate.
}
