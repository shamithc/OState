module OState
  class Committee

    attr_reader  :id, :committee, :created_at, :updated_at, :all_ids,
      :parent_id, :state, :sources, :subcommittee, :members, :chamber

    def self.find committee_id
      Configuration.base_class.committee.find(committee_id)
    end

    def self.search options = {}
      Configuration.base_class.committee.search(options)
    end

    def initialize(args)
      args.each do |key, value|
        key = key.gsub(/[^0-9A-Za-z\s_]/, '')
        instance_variable_set "@#{key.gsub(' ', '_')}", value
      end
    end

    def self._new(args)
      self.new(args)
    end
  end
end
