require 'rest_client'

module KaModUsers
	class Token
		@@resource = RestClient::Resource.new "#{KaModUsers::Engine.user_extension_api_endpoint}/tokens"

		def self.resource
			@@resource
		end
	end
end