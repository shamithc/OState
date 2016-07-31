module OState
  class ResourceCollection
    include Enumerable

    attr_reader :collection

    def initialize(response, object_class)
      @collection = sanitize_objects(response, object_class)
    end

    def each(&block)
      @collection.each(&block)
    end

    private

    def sanitize_objects(response, object_class)
      response.map do |res|
        object_class.send(:new, res)
      end
    end
  end
end
