# Aws_S3_Test_1

- Ruby 2.3.3

## S3にファイルをアップロードする

- aws-sdk は 2.x
- .aws/credentials を利用している
  - IAM でもいける？

## やってみること

- [ ] テストを書く

## コード

```ruby
# frozen_string_literal: true
require 'aws-sdk'
require "pry"

BUCKET_NAME = "rails-fileup-matsuhisa"
DIRECTORY_PATH = "foo/bar"

class S3Upload
  def initialize
    @s3 = Aws::S3::Resource.new
  end

  def upload_file_path(file_path)
    upload_file_path = "#{DIRECTORY_PATH}/#{file_name(file_path)}"
    bucket = @s3.bucket(BUCKET_NAME)
    bucket.object(upload_file_path).upload_file(file_path, { acl: "public-read"} )
  end

  private

  def file_name(file_path)
    extname = File.extname file_path
    "#{Time.now.to_i}_foo#{extname}"
  end

end
```
