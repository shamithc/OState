module OState
  class District
    class Base

      def initialize(base_class)
        @base_class = base_class
      end

      def find boundary_id
        resonse = @base_class.http.get("api/v1/districts/boundary/#{boundary_id}/")
        District.new(resonse)
      end

      def search state, chamber
        path = "/api/v1/districts/#{state}/#{chamber}/"
        resonse = @base_class.http.get(path)
        ResourceCollection.new(resonse, District)
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
