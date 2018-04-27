Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create, :delete]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  root 'welcome#index'


  resources :testings

  resources :articles

  resources :admins, only: [:index] 

  resources :users, only: [:index, :show]

  resources :admin_selections, only: [:create, :delete]

  get 'braintree/new'
  post 'braintree/checkout'
  get "/demo" => "tests#bbc", as: "demo"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/article" => "tests#show" , as: "show"
  get "/homepage" => "tests#homepage", as: "homepage"
  
  get "/index" => "tests#index" , as: "index"
  get "/new" => "tests#new" , as: "new"
  post "/create" => "tests#create" , as: "create"
end
