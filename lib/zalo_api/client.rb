require 'faraday'

require 'zalo_api/version'
require 'zalo_api/configuration'
# require 'zalo_api/silent_mash'
# require 'zalo_api/middleware/request/etag_cache'
# require 'zalo_api/middleware/request/retry'
# require 'zalo_api/middleware/request/upload'
# require 'zalo_api/middleware/request/encode_json'
# require 'zalo_api/middleware/request/url_based_access_token'
# require 'zalo_api/middleware/response/callback'
# require 'zalo_api/middleware/response/deflate'
# require 'zalo_api/middleware/response/gzip'
# require 'zalo_api/middleware/response/sanitize_response'
# require 'zalo_api/middleware/response/parse_iso_dates'
# require 'zalo_api/middleware/response/parse_json'
# require 'zalo_api/middleware/response/raise_error'
# require 'zalo_api/middleware/response/logger'
# require 'zalo_api/delegator'

module ZaloAPI
  class Client
    # @return [Configuration] Config instance
    attr_reader :config

    attr_reader :access_token

    def initialization
      raise ArgumentError, 'block not given' unless block_given?

      @config = ZaloAPI::Configuration.new
      yield config
    end
      # Creates a new API client.
      # @param [String] access_token access token
      # @param [String] app_secret app secret, for tying your access tokens to your app secret
      #                 If you provide an app secret, your requests will be
      #                 signed by default, unless you pass appsecret_proof:
      #                 false as an option to the API call. (See
      #                 https://developers.facebook.com/docs/graph-api/securing-requests/)
      # @note If no access token is provided, you can only access some public information.
      # @return [Koala::Facebook::API] the API client
      def initialize(access_token = Koala.config.access_token, app_secret = Koala.config.app_secret)
        @access_token = access_token
      end
  end
end
