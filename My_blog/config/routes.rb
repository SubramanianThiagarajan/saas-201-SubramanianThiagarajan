Rails.application.routes.draw do
	devise_for :users
	root to: "static_pages#index"
	resources :blog_posts, only: [:index, :create, :new, :show,:edit,:update,:destroy]
	resources :about_me, only: [:index]
	resources :contacts, only: [:new, :create]
	resources :blog_posts do
		resources :comments
		resources :likes
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
