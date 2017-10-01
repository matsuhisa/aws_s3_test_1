# frozen_string_literal: true
require 'aws-sdk'

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
