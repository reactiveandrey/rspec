require 'webmock/rspec'

module Ilobster
  module SourceAPIStubs
    require_relative 'instagram_stubs.rb'
    include InstagramStubs

    require_relative 'flickr_stubs.rb'
    include FlickrStubs

    #
    # Stubs any external requests for images to a local pic of a cat
    #
    def stub_media_download
      cat_path = "#{Rails.root}/spec/fixtures/cat.jpg"

      stub_flickr_media_download(cat_path)
      stub_instagram_media_download(cat_path)
    end
  end
end
