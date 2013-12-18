module Requests
  module JsonHelpers
    def json_response
      @json ||= JSON.parse(response.body)
    end
  end
end