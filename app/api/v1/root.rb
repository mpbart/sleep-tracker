require 'grape'

module V1
  class Root < Grape::API
    format :json

    mount ::V1::Login
    mount ::V1::SleepQuality
  end
end
