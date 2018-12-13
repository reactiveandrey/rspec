module Ilobster
  module FlickrStubs
    CDN_BASE = 'https://farm4.staticflickr.com'
    #
    # Generic method to stub a Flickr API call.
    #
    # @param name [String] Name of the API method.
    # @param req_opts [Hash] Hash of options for the stubbed request.
    # @param res_opts [Hash] Hash of options for the stubbed response.
    #
    def stub_flickr_method(name, res_opts = {}, req_opts = {})
      req_opts.reverse_merge!(format: 'json',
                              nojsoncallback: '1',
                              method: name)

      req = stub_request(:post, 'https://api.flickr.com/services/rest/')
      res = res_opts.to_json

      req.with(body: hash_including(req_opts)).to_return(body: res)
    end

    #
    # Stubs metacall to list the API methods themselves.
    #
    def stub_flickr_api_list
      resp = { methods: {
                 method: [ { _content: 'flickr.photos.search' },
                           { _content: 'flickr.photos.getSizes' },
                           { _content: 'flickr.photos.getInfo' } ] } }

      stub_flickr_method('flickr.reflection.getMethods', resp)
    end

    #
    # Stubs all flickr media download with a local file.
    #
    # @path [String] Path to file that will stub the download
    #
    def stub_flickr_media_download(path)
      req = stub_request(:get, /#{CDN_BASE}/)

      content = File.read(path)
      req.to_return(body: content, headers: { 'Content-Type' => 'image/jpeg' })
    end
  end
end
