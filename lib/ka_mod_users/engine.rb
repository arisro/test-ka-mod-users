module KaModUsers
  class Engine < Rails::Engine
    isolate_namespace KaModUsers

    # allows http verb override via _method
    config.middleware.use Rack::MethodOverride

    config.middleware.use Rack::Cors do
        allow do
            origins '*'
            resource '*', :headers => :any, :methods => [:get, :post, :options]
        end
    end

    @@facebook_config = YAML::load_file("#{self.root}/config/facebook.yml")

    initializer :set_secret_key_base do |app|
        app.config.secret_key_base = "diE7UCDvDftoAnc0bqgr"
    end

    def self.root
        File.join(File.dirname(__FILE__), '../../')
    end

    def self.facebook_config
    	@@facebook_config
    end
  end
end