require 'rest_client'

module KaModUsers
	class User
		@@resource = RestClient::Resource.new 'http://api.ka.local:8080/extusers/users'

		def self.resource
			@@resource
		end
	end
end