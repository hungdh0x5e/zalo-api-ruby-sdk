require 'faraday'

require 'zalo_api/version'
require 'zalo_api/configuration'
require 'zalo_api/middleware/request/encode_json'
require 'zalo_api/middleware/request/url_based_access_token'
require 'zalo_api/middleware/response/sanitize_response'
require 'zalo_api/middleware/response/parse_json'

module ZaloAPI
  class Client
    # @return [Configuration] Config instance
    attr_reader :config

    def initialize
      raise ArgumentError, 'block not given' unless block_given?

      @config = ZaloAPI::Configuration.new
      yield config

      set_default_logger
    end

    # Creates a connection if there is none, otherwise returns the existing connection.
    #
    # @return [Faraday::Connection] Faraday connection for the client
    def connection
      @connection ||= build_connection
      return @connection
    end

    # Called by {#connection} to build a connection. Can be overwritten in a
    # subclass to add additional middleware and make other configuration
    # changes.
    #
    # Uses middleware according to configuration options.
    #
    # Request logger if logger is not nil
    #
    # Retry middleware if retry is true
    def build_connection
      Faraday.new(config.options) do |builder|
        # response
        builder.use ZaloAPI::Middleware::Response::ParseJson
        builder.use ZaloAPI::Middleware::Response::SanitizeResponse
        builder.use ZendeskAPI::Middleware::Response::Logger, config.logger if config.logger
        builder.adapter(Faraday.default_adapter)

        # request
        builder.use ZaloAPI::Middleware::Request::UrlBasedAccessToken, config.access_token
        builder.use ZaloAPI::Middleware::Request::EncodeJson
      end
    end

    def set_default_logger
      if config.logger.nil? || config.logger == true
        require 'logger'
        config.logger = Logger.new($stderr)
        config.logger.level = Logger::WARN
      end
    end
  end
end
