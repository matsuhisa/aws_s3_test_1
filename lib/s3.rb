# frozen_string_literal: true
require 'aws-sdk'

BUCKET_NAME = "rails-fileup-matsuhisa"
FILE_NAME = "test.jpg"
REGION = "ap-northeast-1"

s3 = Aws::S3::Resource.new
bucket = s3.bucket(BUCKET_NAME)
bucket.object("#{Time.now.to_i}_#{FILE_NAME}").upload_file(FILE_NAME, { acl: "public-read"} )
