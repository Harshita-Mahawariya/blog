
Rails.application.routes.draw do
  root "articles#index"
  #get "/articles", to: "articles#index"
  #to show all article list
  #get "/articles/:id", to: "articles#show"
  #to show single article list
  # For details on the DSL available within this 
  #file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
end
