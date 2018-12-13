module Ilobster
  module InstagramStubs
    USER_ENDPOINT = 'https://api.instagram.com/v1/users/self'
    CDN_BASE = 'http://scontent-b.cdninstagram.com'

    #
    # Builds a fake json response for Instagram API.
    #
    # @param data [Hash] Returned data.
    # @param status [Integer] Returned status code.
    # @param err [Hash] Returned error information.
    #
    def api_response(data, status, err = {})
      meta = err.empty? ? { code: status } : { code: status }.merge(err)

      { data: data, meta: meta }.to_json
    end

    #
    # Stubs a request for user info to Instagram API.
    #
    # @param username [String] Username to be returned by the fake request.
    # @param success [Boolean] Expected success of the request.
    #
    # @return An Instagram-like response for a the request.
    #
    def stub_instagram_user_request(username, success)
      req = stub_request(:get, /#{USER_ENDPOINT}/)

      if success
        return req.to_return(body: api_response({ username: username }, 200))
      end

      err = { error_type: 'APIRequiresAuthenticationError' }

      req.to_return(body: api_response({}, 400, err))
    end

    #
    # Stubs all Instagram media download with a local file.
    #
    # @path [String] Path to file that will stub the download
    #
    def stub_instagram_media_download(path)
      req = stub_request(:get, /#{CDN_BASE}/)

      content = File.read(path)
      req.to_return(body: content, headers: { 'Content-Type' => 'image/jpeg' })
    end
  end
end
