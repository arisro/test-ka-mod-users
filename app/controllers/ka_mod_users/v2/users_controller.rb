module KaModUsers
  module V2
    class UsersController < KaModUsers::ApplicationController
      before_filter :authenticate, :only => [ :index, :update]

      # returns only the current user!
      def index
        @users = User.resource[@current_user[:id]].get
        render json: @users
      end

      # can update only his own user
      def update
        User.resource[params[:id]].patch(params)
        head :no_content
      end

      def login_uri
        if params[:callback].nil?
          head :bad_request
        else
          fb_client = Facebook::Client.new
          url = fb_client.authorize_url(:callback => params[:callback])

          render json: {:login_url => url}
        end
      end
    end
  end
end