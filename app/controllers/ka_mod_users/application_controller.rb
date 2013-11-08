module KaModUsers
  class ApplicationController < ::ApplicationController
  	include ActionController::HttpAuthentication::Token::ControllerMethods
  	include KaModUsers::ApplicationHelper

  	def authenticate
  		authenticate_or_request_with_http_token do |token, options|
  			token = ActiveSupport::JSON.decode(Token.resource[token].get) rescue nil
    		@current_user = token['user'] if token
        @current_user['token'] = token['token'] if token

    		if @current_user.nil?
    			head :unauthorized
    		else
    			return @current_user
    		end
  		end
  	end
  end
end