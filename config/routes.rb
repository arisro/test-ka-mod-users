KaModUsers::Engine.routes.draw do
	resources :users, :only => [:index, :update]
	resources :sessions, :only => [:create, :delete]

	get "login_url" => 'users#get_login_url'
	get "login" => 'sessions#create'
	get "logout" => 'sessions#delete'

	namespace :admin do
		resources :users, :only => [:index, :show, :update, :delete]
	end
end