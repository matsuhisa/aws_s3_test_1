#require 'spec_helper'

RSpec.describe S3Upload do

  describe '#initialize' do
    let(:actual){ S3Upload.new }

    it do
      expect(actual).to be actual
    end
  end
end
