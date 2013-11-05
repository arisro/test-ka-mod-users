require 'rest_client'

module KaModUsers
	class Token
		@@resource = RestClient::Resource.new 'http://www.ka.local:8080/extusers/tokens'

		def self.resource
			@@resource
		end
	end
end