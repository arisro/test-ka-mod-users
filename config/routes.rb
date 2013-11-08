KaModUsers::Engine.routes.draw do
	scope :module => 'v1', constraints: KaModUsers::VersionConstraints.new({version: 1, default: :true}) do
		resources :users, :only => [:index, :update]
		resources :sessions, :only => [:create, :destroy]

		get "login_url" => 'users#get_login_url'
		post "login" => 'sessions#create'
		get "logout" => 'sessions#destroy'
	end

	namespace :admin do
		resources :users, :only => [:index, :show, :update, :delete]
	end
end