Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'welcome/index'
  get 'dashboard', to: 'dashboard#show'
  get 'view/form/:id', to: 'receipt#view', :as => "form_view"
  get 'view/receipt/:id', to: 'receipt#receipt_view', :as => "receipt_view"
  patch 'view/receipt/payment_update/:id', to: 'receipt#payment_update', :as => "payment_update"
  patch 'dashboard/receipt/shipment_update/:id', to: 'receipt#shipment_update', :as => "shipment_update"
  get 'dashboard/receipt/shipment_update_all', to: 'receipt#shipment_update_all_view', :as => "shipment_update_all_view"
  patch 'dashboard/receipt/shipment_update_all', to: 'receipt#shipment_update_all', :as => "shipment_update_all"
  resources :company, :path => "dashboard/company"
  resources :product, :path => "dashboard/product"
  resources :form, :path => "dashboard/form"
  resources :receipt, :path => "dashboard/receipt"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
