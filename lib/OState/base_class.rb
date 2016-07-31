module OState
  class BaseClass
  	attr_reader :config

    def initialize(config)
      @config = config
    end

    def state_metadata
    	StateMetadata::Base.new(self)
    end

    def bill
      Bill::Base.new(self)
    end

    def http
      Http.new(self)
    end
  end
end
