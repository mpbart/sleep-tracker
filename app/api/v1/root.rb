require 'grape'
require 'sleep_tracking/interface'

module V1
  class Root < Grape::API
    format :json

    helpers do
      def authenticate_user!
        result = Authenticate::User.authenticate_from_token(headers['X-User-Token'])
        unless result[:current_user]
          Rails.logger.error(result[:error])
          error! 'Unauthorized', 401
        end

        @interface = SleepTracking::Interface.new(result[:current_user])
      end
    end

    mount ::V1::RegisterUser
    mount ::V1::Login
    mount ::V1::SleepQuality
  end
end
