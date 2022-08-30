require 'entity/base'
require 'entity/boolean_data_point'
require 'entity/integer_data_point'
require 'entity/time_data_point'

module Entity
  class SleepQuality < Entity::Base
    MODEL_ATTRIBUTES = [:date, :sleep_rating, :sleep_duration, :user_id]

    def build
      {
        date: @obj.date.strftime("%y/%m/%d"),
        rating: @obj.sleep_rating,
        duration: @obj.sleep_duration,
        boolean_data_points: @obj.boolean_data_points.map{ |d| {value: d.value, name: d.name} },
        integer_data_points: @obj.integer_data_points.map{ |d| {value: d.value, name: d.name} },
        time_data_points: @obj.time_data_points.map{ |d| {value: d.value, name: d.name} },
      }
    end

    def persist!
      record = @obj.save!
      persist_associations
    end

    def persist_associations
      @built_obj[:boolean_data_points].each do |bdp|
        bdp.set_association(Entity::BooleanDataPoint.sleep_quality_pkey, @obj.id)
        bdp.persist!
      end
      @built_obj[:integer_data_points].each do |idp|
        idp.set_association(Entity::IntegerDataPoint.sleep_quality_pkey, @obj.id)
        idp.persist!
      end
      @built_obj[:time_data_points].each do |tdp|
        tdp.set_association(Entity::TimeDataPoint.sleep_quality_pkey, @obj.id)
        tdp.persist!
      end
    end

    def self.from_hash(hash)
      instance = new(activerecord_class.new(hash.slice(*MODEL_ATTRIBUTES)))
      instance[:boolean_data_points].concat(data_points_to_array(hash[:boolean_data_points], Entity::BooleanDataPoint))
      instance[:integer_data_points].concat(data_points_to_array(hash[:integer_data_points], Entity::IntegerDataPoint))
      instance[:time_data_points].concat(data_points_to_array(hash[:time_data_points], Entity::TimeDataPoint))
      instance
    end

    def self.data_points_to_array(data_points, entity_klass)
      data_points&.map{ |dp| entity_klass.from_hash(dp) } || []
    end

    def self.activerecord_class
      ::SleepQuality
    end
  end
end
