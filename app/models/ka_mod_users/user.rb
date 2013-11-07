require 'rest_client'

module KaModUsers
	class User
		@@resource = RestClient::Resource.new "#{KaModUsers::Engine.user_extension_api_endpoint}/users"

		def self.resource
			@@resource
		end
	end
end