require 'authenticate/user'

module V1
  class Login < Grape::API
    namespace :login do
      params do
        requires :username, type: String
        requires :pin, type: Integer
      end

      post do
        result = Authenticate::User.login_user(username: params[:username], pin: params[:pin])
        if result[:error]
          status 401
          {error: result[:error]}
        else
          status 200
          {access_token: result[:access_token]}
        end
      end
    end
  end
end
