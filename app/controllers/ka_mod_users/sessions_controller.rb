require 'securerandom'

module KaModUsers
  class SessionsController < KaModUsers::ApplicationController
    before_filter :authenticate, :only => ["delete"]
    
    def create
      if params[:access_token].nil? || params[:website_id].nil?
        head :bad_request
      else
        # validate token etc.
        fb_client = Facebook::Client.new(:token => params[:access_token])
        fb_user = fb_client.me

        # we couldn't use the access_token on Facebook api
        unless fb_user.nil?
          # this can also be done in one shot with a single request to the users extension!
          user = RestClient.get User.resource.to_s, {:params => {'filter[email]' => fb_user['email']}}
          # RestClient should do this by itself! Response headers are correct, strange that it is not decoding it!
          user = ActiveSupport::JSON.decode(user).first

          if user.nil?
            user = User.resource.post({:email => fb_user['email'], :website_id => params[:website_id]})
          end

          # generate internal session token
          internal_token = SecureRandom.hex(16)

          token = User.resource["#{user['id']}/tokens"].post({:token => {:external_token => params[:access_token], :website_id => params[:website_id], :token => internal_token}})

          render json: {:token => token, :user => user}
        else
          head :bad_request
        end
      end
    end
    
    def delete
    	Token.resource[params[:id]].delete
      head :no_content
    end
  end
end