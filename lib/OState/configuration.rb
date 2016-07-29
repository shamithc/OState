module OState
  class Configuration

    attr_reader :api_key

    class << self
      attr_writer :api_key
      attr_reader :api_key
    end

    def self.base_class
      BaseClass.new(initiate)
    end

    def self.initiate
      new(:api_key => api_key)
    end

    def initialize(options = {})
      instance_variable_set "@api_key", options[:api_key]
    end
  end
end
