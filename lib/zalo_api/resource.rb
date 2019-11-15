require 'zalo_api/config'

module ZaloAPI
  class Resource
    attr_reader :attributes

    # Create a new resource instance.
    # @param [Client] client The client to use
    # @param [Hash] attributes The optional attributes that describe the resource
    def initialize(client, attributes = {})
      raise "Expected a Hash for attributes, got #{attributes.inspect}" unless attributes.is_a?(Hash)

      @client = client
      @attributes = attributes
    end

    def base_url
      @base_url ||= "%s/%s" % [ZaloAPI::Config::OA_API_BASE, ZaloAPI::Config::OA_API_VERSION]
      return @base_url
    end
  end
end
