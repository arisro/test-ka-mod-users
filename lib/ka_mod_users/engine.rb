module KaModUsers
  class Engine < Rails::Engine
    isolate_namespace KaModUsers

    # allows http verb override via _method
    config.middleware.use Rack::MethodOverride

    @@facebook_config = YAML::load_file("#{self.root}/config/facebook.yml")

    def self.root
        File.join(File.dirname(__FILE__), '../../')
    end

    def self.facebook_config
    	@@facebook_config
    end
  end
end