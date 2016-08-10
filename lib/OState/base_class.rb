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

    def legislator
      Legislator::Base.new(self)
    end

    def committee
      Committee::Base.new(self)
    end

    def event
      Event::Base.new(self)
    end

    def district
       District::Base.new(self)
    end

    def http
      Http.new(self)
    end
  end
end
