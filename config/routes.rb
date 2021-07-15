Rails.application.routes.draw do
  root "deputies#index" 

  resources :uploads

  resources :deputies do
    resources :expenses
  end
end
