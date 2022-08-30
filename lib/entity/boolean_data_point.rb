require 'entity/data_point'

module Entity
  class BooleanDataPoint < Entity::DataPoint
    def self.sleep_quality_pkey
      :sleep_quality_id
    end

    def self.activerecord_class
      ::BooleanDataPoint
    end
  end
end
