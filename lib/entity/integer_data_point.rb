require 'entity/data_point'

module Entity
  class IntegerDataPoint < Entity::DataPoint
    def self.sleep_quality_pkey
      :sleep_quality_id
    end

    def self.activerecord_class
      ::IntegerDataPoint
    end
  end
end
