module OState
  class ResourceCollection
    include Enumerable

    attr_reader :collection

    def initialize(response)
      @collection = sanitize_objects(response)
    end

    def each(&block)
      @collection.each(&block)
    end

    private

    def sanitize_objects(response)
      response.map do |res|
        StateMetadata.new(res)
      end
    end
  end
end
