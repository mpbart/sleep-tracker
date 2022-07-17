module Repository
  class SleepQuality
    def self.where(**attributes)
      SleepQuality.where(**attributes).map{ |s| Entity::SleepQuality.from_database_record(s) }
    end
  end
end
