require 'entity/data_point'

module Entity
  class TimeDataPoint < Entity::DataPoint
    def self.sleep_quality_pkey
      :sleep_quality_id
    end

    def self.activerecord_class
      ::TimeDataPoint
    end
  end
end
