module OState
  class Http

    def initialize(base_class)
      @base_class = base_class
      @api_key = @base_class.config.api_key
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
        raise BadRequestError,"Bad Request - request too large or missing parameter. see doc: http://sunlightlabs.github.io/openstates-api/index.html"
      when 500
        raise InternalServerError
      end
    end

    private

    def _do_get path
      connection = Net::HTTP.new('openstates.org', 80)
      connection.start do |http|
        request =  Net::HTTP::Get.new(path)
        request["Accept"] = "application/json"
        request["X-APIKEY"] = @api_key
        http.request(request)
      end
    end
  end
end
