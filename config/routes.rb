CuberootLts::Application.routes.draw do

  get "holidays/index"

  match "/leaves/set_year" => "leaves", :action => "set_year"
  match "/users/find_user_emails" => "users", :action => "find_user_emails"

  devise_for :users, controllers: {sessions: "sessions",
                                   registrations: "registrations"}
  devise_scope :user do
    match "/registrations/second_step" => "registrations",
      action: "second_step"
    match "/registrations/first_step" => "registrations", action: "first_step"
    match "/registrations" => "registrations", :action => "create"
  end

  resources :leaves, only: [:show, :new, :create, :update, :destroy, :index, :set_year] do
    member do
      get 'approve_reject', 'change_year', 'reject_approved_leaves'
    end
    collection do
      post 'set_year'
    end
  end

  resources :users, only: [:show, :edit, :update, :destroy, :index, :find_user_emails, :user_profile, :edit_user_profile] do
    member do
      get 'user_management'
    end
    member do
      get 'find_user_emails'
    end
    member do 
      get 'user_profile'
    end
    collection do 
      post 'edit_user_profile'
    end
  end

  resources :registrations, only: [:create] do
    collection do
      post 'first_step'
    end
  end

  resources :registrations, only: [:create] do
    collection do
      post 'second_step'
    end
  end

  resources :setups

  resources :holidays, only: [:show, :new, :create, :update, :destroy, :index, :edit]

root to: "home#index"

end
