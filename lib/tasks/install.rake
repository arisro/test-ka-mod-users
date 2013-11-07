require 'rails/generators'
require "#{KaModUsers::Engine.root}/lib/generators/ka_mod_users/install_generator.rb"

namespace :ka do
	namespace :modusers do
		desc 'Copies the users module config file to main app'
		task :install => :environment do
			gen = KaModUsers::Generators::InstallGenerator.new
			gen.copy_config
			gen.setup_route
		end
	end
end