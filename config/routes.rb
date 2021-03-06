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
  resources :likes, only: [:create]
  resources :follows, only: [:create]

  get 'welcome/index'
  root 'welcome#index'

  get 'braintree/new'
  post 'braintree/checkout'
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/admin" => "admins#index", as: "admin_index"
  post "/admin" => "admins#create", as: "admin_create"
  get "/article" => "welcome#article", as: "article_page" 
  post "/article" => "welcome#comment", as: "comment_create"
  get "/search" => "welcome#search", as: "search"
  get "/general" => "welcome#general", as: "general_page"
  get "/business" => "welcome#business", as: "business_page"
  get "/technology" => "welcome#technology", as: "technology_page"
  get "/health" => "welcome#health", as: "health_page"
  get "/sport" => "welcome#sport", as: "sport_page"

  post "/bookmark" => "welcome#bookmark", as: "bookmark_create"
  post "/article/reply" => "welcome#reply", as: "reply_create"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment

  get "preference" => "welcome#preference", as: "preference_page"
 
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get "/statistic" => "welcome#statistic", as: "preference_show"

  patch "/preferenceupdate" => "preference#update", as: "preference_update"
  delete "/preferencedelete" => "preference#destroy", as: "preference_delete"

  get "/subscribe" => "braintree#show", as: "subscribe"



end


