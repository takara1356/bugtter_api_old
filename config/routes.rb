Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts do
        collection do
          post 'user_posts'
        end
      end
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :create ] do
        collection do
          post 'sign_in'
          get 'me'
        end
      end
    end
  end
end
