Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount ::V1::Root => '/'
    end
  end
end
