Rails.application.routes.draw do
  
#https://calm-castle-11120.herokuapp.com/

# git push heroku master
# If you're not developing on master deploy with:

# git push heroku your_branch_name:master


  post 'proposals/url', to: 'proposals#url'

  get 'users/getuser', to: 'users#getuser'

  resources :users do 
  	resources :buckets
  	resources :proposals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
