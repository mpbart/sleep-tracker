module SleepTracking
  class Interface
    # Public interface for interacting with all sleep related data plus
    # related data points

    def record_sleep(params)
    end

    def retrieve_sleep_data_for_single_date(date)
    end

    def retrieve_sleep_data_for_date_range(start_date, end_date)
    end
  end
end
