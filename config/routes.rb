Rails.application.routes.draw do
  resources :rooms do
    resources :chats
  end

  get "search", to: "search#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :conversations do
    resources :messages
  end

  get "jobadd", to: "job_positions#job"

  get "joblist", to: "job_positions#list"

  get "userlist", to: "users#list"

  resources :job_positions

  post "/job_positions/new", to: "job_positions#create"

  patch "/job_positions/:id/edit", to: "job_positions#update"

  get "/job_position/:id", to: "job_positions#destroy", as: "job_position_delete"

  resources :job_fields

  post "/job_fields/new", to: "job_fields#create"

  patch "/job_fields/:id/edit", to: "job_fields#update"

  get "/job_field/:id", to: "job_fields#destroy", as: "job_field_delete"

  get "/job_navigations/:id/edit", to: "job_navigations#edit", as: "edit_job_navigation"

  resources :job_navigations

  get "new_job_navigation", to: "job_navigations#new"

  post "/job_navigations/new", to: "job_navigations#create"

  get "/job_navigations/:id/toggle_is_approved", to: "job_navigations#toggle_is_approved",
                                                 as: "toggle_is_approved"

  get "/job_navigations/:id/destroy", to: "job_navigations#destroy", as: "job_navigation_del"

  get "/job_navigation", to: "job_navigations#show"

  resources :job_navigations, only: %i[index destroy] do   # Index page for only admin to approve or reject reviews
    member do
      patch :toggle_is_approved
    end
  end

  resources :job_navigations, only: %i[show] do
    resources :reviews
  end

  resources :job_navigations, only: %i[show edit] do
    resources :applies
  end

 get "/job_navigations/:job_navigation_id/applies/:id/edit", to: "job_navigations#edit"

  post "/job_navigation", to: "job_navigations#show"

  resources :users

  post "/users/:id/follow", to: "users#follow", as: "follow"
  post "/users/:id/unfollow", to: "users#unfollow", as: "unfollow"
  post "/users/:id/accept", to: "users#accept", as: "accept"
  post "/users/:id/decline", to: "users#decline", as: "decline"
  post "/users/:id/cancel", to: "users#cancel", as: "cancel"

  get "/user/:id", to: "users#destroy", as: "user_delete"

  get "notification", to: "users#notification"

  get "connection", to: "users#connection"

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "user_info", to: "user_infs#new"
  post "user_info", to: "user_infs#create"

  get "signing_up", to: "enrolls#new"
  post "signing_up", to: "enrolls#create"

  delete "loggingout", to: "sections#destroy"

  get "signing_in", to: "sections#new"
  post "signing_in", to: "sections#create"

  get "job_part", to: "job_navigations#job"

  post "job_show", to: "comment_posts#create"

  get "job_apply", to: "apply_jobs#new"
  post "job_apply", to: "apply_jobs#create"

  get "add_user", to: "add_networks#index"

  post "follow_account", to: "add_networks#connection"

  resources :profiles

  get "/profile/:id", to: "profiles#edit", as: "edit_profile_edit"

  get "job_all", to: "job_navigations#all"

  get "new_profile", to: "profiles#new"

  root to: "main#index"

  get "dashboard", to: "profiles#dashboard"
end
