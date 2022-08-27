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

    # TODO: Figure out how to persist sleep qualities with associations to both a user
    # and all data points
    def persist!
      record = @obj.save!
      persist_associations
    end

    def persist_associations
      @built_obj[:boolean_data_points].each{ |bdp| @obj.boolean_data_points << Entity::BooleanDataPoint.from_hash(bdp) }
      @built_obj[:integer_data_points].each{ |idp| @obj.integer_data_points << Entity::IntegerDataPoint.from_hash(idp) }
      @built_obj[:time_data_points].each{ |tdp| @obj.time_data_points << Entity::TimeDataPoint.from_hash(tdp) }
    end

    # TODO: This still doesn't work correctly to build the entity from a hash with associated data
    # As-is all associations are blank because #build is looking for those on a new instance of
    # the model instead of from the passed in hash data
    def self.from_hash(hash)
      new(activerecord_class.new(hash.slice(*MODEL_ATTRIBUTES)))
    end

    def self.activerecord_class
      ::SleepQuality
    end
  end
end
