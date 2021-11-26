Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :post_comments
    get 'post_likes/index'
    delete 'post_likes/:id(.:format)' => 'post_likes#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
