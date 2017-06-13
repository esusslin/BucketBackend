Rails.application.routes.draw do
  

  post 'proposals/url', to: 'props#url'
  
  resources :users do 
  	resources :buckets
  	resources :proposals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
