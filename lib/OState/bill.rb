module OState
  class Bill

    attr_reader :id, :title, :alternate_titles, :actions,:state, :sources, :session,
      :country, :votes, :documents, :companions, :all_ids,  :subjects, :scraped_subjects,
      :type, :sponsors,  :action_dates, :level, :versions, :chamber, :bill_id, :created_at,
      :updated_at

    def self.find bill_id
      Configuration.base_class.bill.find(bill_id)
    end

    def self.search options = {}
    	Configuration.base_class.bill.search(options)
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
