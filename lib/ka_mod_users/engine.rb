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

    @@config = nil

    initializer :set_secret_key_base do |app|
        app.config.secret_key_base = "diE7UCDvDftoAnc0bqgr"
    end

    def self.root
        File.join(File.dirname(__FILE__), '../../')
    end

    def self.load_config
        config_file_path = "#{KaApi.root}/config/ka_mod_users.yml"
        if File.exists?(config_file_path)
            @@config = YAML::load_file(config_file_path)
        end
    end

    def self.config
        self.load_config if @@config.nil?
        return @@config
    end

    def self.facebook_config
        self.load_config if @@config.nil?
        if !@@config.nil?
          return @@config['facebook'] 
        else
          return nil
        end
    end

    def self.http_proxy
        self.load_config if @@config.nil?
        if !@@config.nil?
          return @@config['http_proxy'] 
        else
          return nil
        end
    end

    def self.user_extension_api_endpoint
        self.load_config if @@config.nil?
        if !@@config.nil?
          return @@config['user_extension_api_endpoint'] 
        else
          return nil
        end
    end
  end
end