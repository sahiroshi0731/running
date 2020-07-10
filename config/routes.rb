Rails.application.routes.draw do
  # ログイン
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'
  
  # ユーザ機能
  namespace :admin do
    resources :users
  end
  
  # レコード一覧
  root  'records#index' 
  resources :records
  
  # アーカイブ
  get  '/records/archives/:yyyymm', to: 'records#archives', as: :record_archive
  
  resources :members
  # ?
  # get  '/member/:id', to: 'root#member', as: :member
  
  # 目標登録
  resources :targets
end
