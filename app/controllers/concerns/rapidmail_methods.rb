module RapidmailMethods
  extend ActiveSupport::Concern

  included do

    protected

    def rapidmail_post_recipient(email, firstname, lastname)
      begin
        RestClient.post "https://#{Figaro.env.rapidmail_api_user}:#{Figaro.env.rapidmail_api_password}@apiv3.emailsys.net/v1/recipients?send_activationmail=yes", {
            "email": email,
            "recipientlist_id": 1287,
            "firstname": firstname,
            "lastname": lastname
        }.to_json, {content_type: :json, accept: :json}
      rescue => ex
        logger.error ex.message
        return ex.message
      end
    end
  end

  module ClassMethods
  end
end
