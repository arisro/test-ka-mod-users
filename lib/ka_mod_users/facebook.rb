require 'json'
require 'mime/types'

module KaModUsers
	module Facebook
		class Client
			def initialize(options = {})
				@application_id = KaModUsers::Engine.facebook_config['app_id']
				@application_secret = KaModUsers::Engine.facebook_config['app_secret']
				@token = options[:token]
			end

			def authorize_url(options = {})
				options[:callback] ||= ''
				options[:scope] ||= 'email'

				params = {:client_id => @application_id, :redirect_uri => options[:callback], :response_type => 'token', :scope => options[:scope]}

				URI::HTTP.build(:host => 'www.facebook.com', :path => '/dialog/oauth', :query => params.to_query).to_s
			end

			def me
				nil unless !@token.nil?

				begin
					RestClient.proxy = "http://buc-net-proxy.ubisoft.org:3128"
					response = RestClient.get "https://graph.facebook.com/me", :params => {:access_token => @token}
					RestClient.proxy = ""
					return ActiveSupport::JSON.decode(response)
				rescue => e
					abort(e.inspect)
					return nil
				end
			end
		end
	end
end