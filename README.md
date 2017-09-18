# Aws_S3_Test_1

- Ruby 2.3.3

## S3にファイルをアップロードする

- aws-sdk は 2.x
- .aws/credentials を利用している
  - IAM でもいける？

## やってみること

- 

## コード

```ruby
# frozen_string_literal: true
require 'aws-sdk'

BUCKET_NAME = "rails-fileup-matsuhisa"
FILE_NAME = "test.jpg"
REGION = "ap-northeast-1"

s3 = Aws::S3::Resource.new
bucket = s3.bucket(BUCKET_NAME)
bucket.object("#{Time.now.to_i}_#{FILE_NAME}").upload_file(FILE_NAME, { acl: "public-read"} )
```
