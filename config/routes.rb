Rails.application.routes.draw do

  devise_for :users
  root to: "trains#index"
  #resources :fails, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  

end
