require 'entity/sleep_quality'

module Repository
  class SleepQuality
    def self.where(**attributes)
      Entity::SleepQuality.activerecord_class.where(**attributes).map do |s|
        Entity::SleepQuality.from_database_record(s)
      end
    end
  end
end
