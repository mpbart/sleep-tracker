require 'entity/sleep_quality'
require 'repository/sleep_quality'

module SleepTracking
  class Interface
    # Public interface for interacting with all sleep related data plus
    # related data points
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def record_sleep(params)
      Entity::SleepQuality.from_hash(params.merge({user_id: user[:id]}).persist!
    end

    def retrieve_sleep_data_for_single_date(date)
      Entity::SleepQuality.find_by(date: date, user_id: user[:id]).build
    end

    def retrieve_sleep_data_for_date_range(start_date, end_date)
      Repository::SleepQuality.where(date: start_date..end_date, user_id: user[:id]).map{ |s| s.build }
    end
  end
end
