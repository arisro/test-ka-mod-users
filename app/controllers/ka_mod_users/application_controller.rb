module KaModUsers
  class ApplicationController < ::ApplicationController
  	include ActionController::HttpAuthentication::Token::ControllerMethods

  	def authenticate
  		authenticate_or_request_with_http_token do |token, options|
  			token = Token.resource[token].get
    		@current_user = token.user if token
  		end
  	end
  end
end