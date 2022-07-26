module V1
  class SleepQuality < Grape::API
    # Must include a valid x-user-token header in order to access this endpoint
    before { authenticate_user! }

    namespace :sleep_quality do
      get 'date/:date' do
        @interface.retrieve_sleep_data_for_single_date(params[:date])
      end

      get 'date_range/:start_date/:end_date' do
        @interface.retrieve_sleep_data_for_date_range(start_date, end_date)
      end

      params do
        requires :date, type: Date
        requires :sleep_rating, type: Integer
        requires :sleep_duration, type: Float
        optional :boolean_data_points, type: Array[JSON] do
          requires :value
          requires :name
        end
        optional :integer_data_points, type: Array[JSON] do
          requires :value
          requires :name
        end
        optional :time_data_points, type: Array[JSON] do
          requires :value
          requires :name
        end
      end

      post 'record_sleep' do
        @interface.record_sleep(params)
      end
    end
  end
end
