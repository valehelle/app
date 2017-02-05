Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'dashboard', to: 'dashboard#show'
  resources :company, :path => "dashboard/company"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
