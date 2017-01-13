# ncmose

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/hogelog/ncmose)

## Requirements
- Ruby 2.4+
- PostgreSQL
- AWS IAM User
    - Polly
    - S3
  
## Setup
- Push Deploy Button
- Setup S3 Bucket
    - [Configure a Bucket for Website Hosting](http://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html)
    - or Publish objects by any other solution
- Setup AWS IAM User
    - polly:SynthesizeSpeech
    - s3:PutObject 
        - Allow above s3 bucket
- Setup environment variables
    - AWS_ACCESS_KEY_ID (required)
    - AWS_SECRET_ACCESS_KEY (required)
        - Above IAM User
    - MP3_S3_REGION (required)
    - MP3_S3_BUCKET (required)
        - Above S3 Bucket
    - MP3_S3_PREFIX (required)
    - MP3_DOWNLOAD_PREFIX (required)
        - HTTP URL for above S3 bucket
    - BASIC_AUTH_USERNAME (optional)
    - BASIC_AUTH_PASSWORD (optional)

