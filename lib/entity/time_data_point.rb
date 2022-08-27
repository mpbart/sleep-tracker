require 'entity/data_point'

module Entity
  class TimeDataPoint < Entity::DataPoint
    def self.activerecord_class
      ::TimeDataPoint
    end
  end
end
