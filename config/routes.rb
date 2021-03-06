Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, except: [:edit, :update, :destroy] do
    resources :doses, only: [:create, :new]
  end
    resources :doses, only: [:destroy]
end
