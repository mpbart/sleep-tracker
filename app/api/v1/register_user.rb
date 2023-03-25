require 'register/user'

module V1
  class RegisterUser < Grape::API
    namespace :register_user do
      params do
        requires :first_name, type: String
        requires :last_name, type: String
        requires :username, type: String
        requires :pin, type: Integer
      end

      post do
        result = Register::User.register!(
          first_name: params[:first_name],
          last_name:  params[:last_name],
          username:   params[:username],
          pin:        params[:pin],
        )
        if result[:error]
          status 401
          {error: result[:error]}
        else
          status 201
          {result: "User registered"}
        end
      end
    end
  end
end
