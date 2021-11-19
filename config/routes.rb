Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
      root to: "users/sessions#new"
    end
   namespace :admin do 
    resources :users
    resources :dashboards
      resources :categories
      resources :sub_categories
      resources :books
      resources :requests do 
        member do
          get :approved
          get :reject
        end
        collection do
          get :filter_by_status
        end

      end
   end
   namespace :student do
    resources :dashboards do
      collection do 
        get :show_categories
        get :show_books
        get :filter_by_search
        get :drop_down_filter
        get :logout
      end
      member do
        get :show_subcategories
        get :book_request
      end
    end
   end
end