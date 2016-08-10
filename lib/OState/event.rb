module OState
  class Event

    attr_reader  :id, :type, :documents, :end, :description, :participants, :agendaDistricts,
      :created_at, :when, :updated_at, :sources, :state, :session, :location,
      :related_bills, :timezone, :chamber

    def self.find committee_id
      Configuration.base_class.event.find(committee_id)
    end

    def self.search options = {}
      Configuration.base_class.event.search(options)
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
