CuberootLts::Application.routes.draw do

  get "holidays/index"

  devise_for :users, :controllers => {:sessions => "sessions"}

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
     collection do
     get 'first_step'
    end

  end

 
  resources :setups

  resources :holidays, only: [:show, :new, :create, :update, :destroy, :index]


root :to => "home#index"

end
