module KaModUsers
	class VersionConstraints
		def initializer(options)
			@version = options[:version]
			@default = options[:default]
		end

		def matches?(req)
			@default || req.headers['Accept'].include?("application/com.ka.v#{@version}")
		end
	end
end