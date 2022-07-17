require 'entity/base'

module Entity
  class SleepQuality < Entity::Base
    def build
      {
        date: @obj.date.strftime("%y/%m/%d"),
        rating: @obj.sleep_rating,
        duration: @obj.sleep_duration,
        boolean_data_points: boolean_data_points.map{ |d| {value: d.value, name: d.name} },
        integer_data_points: integer_data_points.map{ |d| {value: d.value, name: d.name} },
        time_data_points: time_data_points.map{ |d| {value: d.value, name: d.name} },
      }
    end

    # TODO: Figure out how to persist sleep qualities with associations to both a user
    # and all data points
    def persist!
    end

    def self.activerecord_class
      ::SleepQuality
    end
  end
end
