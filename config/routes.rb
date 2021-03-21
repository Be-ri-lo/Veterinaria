Rails.application.routes.draw do
  resources :clients do
    resources :pets do
      resources :histories
    end
  end
  
  root 'clients#index'
  
end
