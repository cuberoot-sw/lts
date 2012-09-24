CuberootLts::Application.routes.draw do

  get "holidays/index"

  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}
  devise_scope :user do
    match "/registrations/second_step" => "registrations", :action => "second_step"
    match "/registrations/first_step" => "registrations", :action => "first_step"
    match "/registrations" => "registrations", :action => "create"
  end

  resources :leaves, only: [:show, :new, :create, :update, :destroy, :index] do
    member do
      get 'approve_reject', 'change_year', 'reject_approved_leaves'
    end
    collection do
      post 'set_year'
    end
  end

  resources :users, only: [:show, :edit, :update, :destroy, :index] do
    member do
      get 'user_management'
    end
#     collection do
#     get 'first_step'
#    end

  end

#  resources :registrations do
#    member do
#      get 'first_step'
#    end
#  end

  resources :registrations do
    collection do
      post 'first_step'
    end
  end

  resources :registrations do
    collection do
      post 'second_step'
    end
  end

  resources :setups

  resources :holidays, only: [:show, :new, :create, :update, :destroy, :index]


root :to => "home#index"

end
