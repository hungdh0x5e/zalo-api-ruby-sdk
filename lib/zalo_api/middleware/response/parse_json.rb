# frozen_string_literal: true

module ZaloAPI
  module Middleware
    module Response
      class ParseJson < Faraday::Response::Middleware
        CONTENT_TYPE = 'Content-Type'
        VALUES = ['application/json', 'text/json']
        dependency 'json'

        def on_complete(env)
          type = env[:response_headers][CONTENT_TYPE].to_s
          type = type.split(';', 2).first if type.index(';')

          return unless VALUES.include?(type)

          unless env[:body].strip.empty?
            env[:body] = JSON.parse(env[:body], symbolize_names: true)
          end
        end
      end
    end
  end
end
