require 'entity/data_point'

module Entity
  class IntegerDataPoint < Entity::DataPoint
    def self.activerecord_class
      ::IntegerDataPoint
    end
  end
end
