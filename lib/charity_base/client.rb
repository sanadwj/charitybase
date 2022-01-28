# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'

module CharityBase
  class Client
    BASE_URL = "https://charitybase.uk/api/".freeze

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
    end

    def charity
      FindResource.new(self)
    end
    
    def charities_list
      SearchResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :ApiKey, api_key
        conn.request :json

        conn.response :dates
        conn.response :json, content_type: "application/json"

        conn.adapter adapter
      end
    end

    def inspect
      "#<CharityBase::Client>"
    end
  end
end
