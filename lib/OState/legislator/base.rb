module OState
  class Legislator
    class Base

      def initialize(base_class)
        @base_class = base_class
      end

      def find leg_id
        resonse = @base_class.http.get("/api/v1/legislators/#{leg_id}/")
        Legislator.new(resonse)
      end

      def search options
        path = "/api/v1/legislators/?" + build_query_string(options)
        resonse = @base_class.http.get(path)
        ResourceCollection.new(resonse, Legislator)
      end

      def geo_lookup options
        path = "/api/v1/legislators/geo/?" + build_query_string(options)
        resonse = @base_class.http.get(path)
        ResourceCollection.new(resonse, Legislator)
      end

      private

      def build_query_string options
        options.map do |key, value|
          "#{key}=#{value}"
        end.join("&")
      end

    end
  end
end
