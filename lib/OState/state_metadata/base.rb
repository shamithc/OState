module OState
  class StateMetadata
    class Base

      def initialize(base_class)
        @base_class = base_class
      end

      def all
        resonse = @base_class.http.get("/api/v1/metadata/")
        ResourceCollection.new(resonse)
      end

      def find(meta_data)
        resonse = @base_class.http.get("/api/v1/metadata/#{meta_data}/")
        StateMetadata.new(resonse)
      end

    end
  end
end
