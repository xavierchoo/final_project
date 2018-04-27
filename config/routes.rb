Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create, :delete]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :welcome, only: [:index, :show]
  resources :testings
  resources :articles

  resources :users, only: [:index, :show, :update, :edit]

  get 'braintree/new'
  post 'braintree/checkout'
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/admin" => "admins#index", as: "admin_index"
  post "/admin" => "admins#create", as: "admin_create"
end
