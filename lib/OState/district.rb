module OState
  class District

    attr_reader  :id, :type, :documents, :end, :description, :participants, :agendaDistricts,
      :created_at, :when, :updated_at, :sources, :state, :session, :location,
      :related_bills, :timezone, :chamber

    def self.find boundary_id
      Configuration.base_class.district.find(boundary_id)
    end

    def self.search state, chamber = nil
      Configuration.base_class.district.search(state, chamber)
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
