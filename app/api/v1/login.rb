module V1
  class Login < Grape::API
    namespace :login do
      params do
        requires :user_id, type: Integer
        requires :pin, type: Integer
      end

      post do
        Rails.logger.info "SOMETHING"
        Rails.logger.info(params.to_h)
        {user_id: params[:user_id], pin: params[:pin]}
      end
    end
  end
end
