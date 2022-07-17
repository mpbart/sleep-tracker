require 'grape'
require 'sleep_tracking/interface'

module V1
  class Root < Grape::API
    format :json

    helpers do
      def authenticate_user!
        current_user = Authenticate::User.authenticate_from_token(headers['x-user-token'])
        status 401 unless current_user

        @interface = SleepTracking::Interface.new(current_user)
      end
    end

    mount ::V1::Login
    mount ::V1::SleepQuality
  end
end
