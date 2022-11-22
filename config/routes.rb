Rails.application.routes.draw do
  
 
  get 'search' , to: "search#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html









   post "follow_account", to: "add_networks#follow_account" , as: 'follow_account'
  


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


get "jobadd", to: "job_positions#index"

get "jobrole_add", to: "job_positions#new"
post "jobrole_add", to: "job_positions#create"


get "jobrole_show", to: "job_positions#show"

delete "jobrole_delete", to: "job_positions#destroy"

get "jobsector_add", to: "job_fields#new"
post "jobsector_add", to: "job_fields#create"


get "jobsector_show", to: "job_fields#show"

delete "jobsector_delete", to: "job_fields#destroy"




get "job_part", to: "job_navigations#job"

get "job_recruit", to: "job_navigations#new"
post "job_recruit", to: "job_navigations#create"

get "job_show", to: "job_navigations#show" 


post "job_show", to: "comment_posts#create"

get "job_apply", to: "apply_jobs#new"
post "job_apply", to: "apply_jobs#create"


get "add_user", to: "add_networks#index"

get "job_review", to: "job_navigations#index"

get "job_approved", to: "job_navigations#toggle_is_approved"

get "job_reject", to: "job_navigations#destroy"

post "follow_account", to: "add_networks#connection"

get "notification", to: "add_networks#new"














root to: "main#index"


resources :user_infs

end
