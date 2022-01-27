module CharityBase
  class Resource
    attr_reader :client
    def initialize(client)
      @client = client
    end

    def post_request(url, body, headers: {})
      client.connection.post(url, body, headers)
    end

    def default_header
      { Authorization: "ApiKey #{client.api_key}" }
    end

    def handle_response(response)
      case response.status
      when 400
        raise Error, "Your request was malformed. #{response.body["error"]}"
      when 404
        raise Error, "No results were found for your request. #{response.body["error"]}"
      end
      response
    end
  end
end
