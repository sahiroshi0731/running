Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'records#index' 
  resources :records
  # get 'records' => 'records#index'
  # get 'records/:id' => 'records#show'
end
