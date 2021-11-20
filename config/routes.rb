Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :post_comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
