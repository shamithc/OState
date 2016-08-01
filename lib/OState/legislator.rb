module OState
  class Legislator

    attr_reader  :id, :fax, :last_name, :updated_at, :sources, :full_name, :old_roles,
      :first_name, :middle_name, :ffice_address, :state, :votesmart_id, :email,
      :all_ids, :leg_id, :active, :photo_url, :phone, :roles, :url, :ountry,
      :created_at, :level, :offices, :suffixes

    def self.find leg_id
      Configuration.base_class.legislator.find(leg_id)
    end

    def self.search options = {}
      Configuration.base_class.legislator.search(options)
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
