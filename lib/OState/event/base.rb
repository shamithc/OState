module OState
  class Event
    class Base

      def initialize(base_class)
        @base_class = base_class
      end

      def find event_id
        resonse = @base_class.http.get("/api/v1/events/#{event_id}/")
        Event.new(resonse)
      end

      def search options
        path = "/api/v1/events/?" + build_query_string(options)
        resonse = @base_class.http.get(path)
        ResourceCollection.new(resonse, Event)
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
