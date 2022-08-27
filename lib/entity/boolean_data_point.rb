require 'entity/data_point'

module Entity
  class BooleanDataPoint < Entity::DataPoint
    def self.activerecord_class
      ::BooleanDataPoint
    end
  end
end
