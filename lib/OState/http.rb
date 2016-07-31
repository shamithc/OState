module OState
  class Http
    # include Exception

    def initialize(base_class)
      @base_class = base_class
      @api_key = @base_class.config.api_key
      # @api_key = "7dc1ba922a424d88af580364c7b8bd05"
    end

    def get(path, query_params = {})
      response = _do_get path
      if response.code.to_i == 200
        JSON.parse(response.body)
      else
        raise_exception(response.code)
      end
    end

    def raise_exception status_code
      case status_code.to_i
      when 401
        raise AuthenticationError
      when 404
        raise NotFoundError
      when 400
        raise BadRequestError,"request too large, try narrowing your search by adding more filters"
      end
    end

    private

    def _do_get path
      connection = Net::HTTP.new('openstates.org', 80)
      connection.start do |http|
        request =  Net::HTTP::Get.new(path)
        request["Accept"] = "application/json"
        request["X-APIKEY"] = @api_key
        response = http.request(request)
        response
      end
    end
  end
end
