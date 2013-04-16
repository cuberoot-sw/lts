CuberootLts::Application.routes.draw do

  get "holidays/index"

  match "/leaves/set_year" => "leaves", :action => "set_year"
  match "/users/find_user_emails" => "users", :action => "find_user_emails"
  match "/users/edit_profile" => "users", :action => "edit_profile" 
  match "/users/change_password" => "users", :action => "change_password"
  match "/users/password_reset" => "users", :action => "password_reset"

  devise_for :users, controllers: {sessions: "sessions",
                                   registrations: "registrations"} do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
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

  resources :users, only: [:show, :edit, :update, :destroy, :index, :find_user_emails, :user_profile, :edit_profile, :change_password, :password_reset] do
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
     post 'edit_profile'
    end
    member do
     get 'change_password'
    end
    collection do
     post 'password_reset'
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
