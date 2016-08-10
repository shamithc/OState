module OState
  class Committee
    class Base

      def initialize(base_class)
        @base_class = base_class
      end

      def find committee_id
        resonse = @base_class.http.get("/api/v1/committees/#{committee_id}/")
        Committee.new(resonse)
      end

      def search options
        path = "/api/v1/committees/?" + build_query_string(options)
        resonse = @base_class.http.get(path)
        ResourceCollection.new(resonse, Committee)
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
