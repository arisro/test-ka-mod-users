module KaModUsers
	module ApplicationHelper
		def current_user=(user)
			@current_user = user
		end

		def signed_in?
			!current_user.nil?
		end
	end
end