module ZaloAPI
  # Holds the configuration options for the client and connection
  class Configuration
    # @return [String] App id
    attr_accessor :app_id

    # @return [String] App secret
    attr_accessor :app_secret

    # @return [Hash] Client configurations (eg ssh config) to pass to Faraday
    attr_accessor :client_options

    # @return [String] OAuth2 access_token
    attr_accessor :access_token

    # @return [Logger] Logger to use when logging requests.
    attr_accessor :logger

    def initialize
      @client_options = {}
    end

    # Sets accept and user_agent headers, and url.
    #
    # @return [Hash] Faraday-formatted hash of options.
    def options
      {
        :headers => {
          :accept => 'application/json',
          :accept_encoding => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          :user_agent => "ZaloAPI Ruby #{ZaloAPI::VERSION}"
        },
        :request => {
          :open_timeout => 10
        }
      }.merge(client_options)
    end
  end
end
