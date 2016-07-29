module OState
  class StateMetadata

    attr_reader :id , :terms, :name, :chambers, :abbreviation, :capitol_timezone,
      :feature_flags, :latest_csv_date, :latest_csv_url, :latest_json_date,
      :latest_update, :legislature_name, :session_details, :latest_json_url,
      :legislature_url

    def self.all
      Configuration.base_class.state_metadata.all
    end

    def self.find meta_data
      Configuration.base_class.state_metadata.find(meta_data)
    end

    def initialize(args)
      args.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end

    def self._new(args)
      self.new(args)
    end

  end
end
