module KaModUsers
	module Admin
		class UsersController < ApplicationController
			def index
		      @users = User.resource.get
		      render json: @users, :callback => params[:callback]
		    end

		    def show
		      @user = User.resource[params[:id]].get
		      render json: @user
		    end

		    def update
		      User.resource[params[:id]].patch(params)
		      head :no_content
		    end

			def delete
				User.resource[params[:id]].delete
      			head :ok
			end
		end
	end
end