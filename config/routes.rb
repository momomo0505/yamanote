Rails.application.routes.draw do

  devise_for :users
  root to: "trains#index"
  resources :trains do
    resources :sheets, only: [:new, :create,:show] 
  end
  

end
