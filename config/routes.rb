Rails.application.routes.draw do
  

  post 'proposals/url', to: 'proposals#url'

  get 'users/getuser', to: 'users#getuser'

  resources :users do 
  	resources :buckets
  	resources :proposals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
