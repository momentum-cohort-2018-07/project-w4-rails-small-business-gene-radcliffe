Rails.application.routes.draw do
  get 'products/list'
  get 'products/categories/:category', to: 'products#category', as: "product_category"
  get 'products/:id', to: "products#view", as: "product_view"
  resource :products
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
