Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'dashboard', to: 'dashboard#show'
  get 'view/form/:id', to: 'receipt#view', :as => "form_view"
  get 'view/receipt/:id', to: 'receipt#receipt_view', :as => "receipt_view"
  resources :company, :path => "dashboard/company"
  resources :product, :path => "dashboard/product"
  resources :form, :path => "dashboard/form"
  resources :receipt, :path => "dashboard/receipt"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
