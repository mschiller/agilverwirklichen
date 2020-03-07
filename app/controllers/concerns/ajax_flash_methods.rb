module AjaxFlashMethods
  extend ActiveSupport::Concern

  included do

    after_action :flash_to_headers

    private

    def flash_to_headers
      return unless request.xhr?
      response.headers['X-Message'] = flash_message
      response.headers["X-Message-Type"] = flash_type

      flash.discard # don't want the flash to appear when you reload page
    end

    def flash_message
      [:error, :warning, :notice, :success].each do |type|
        return flash[type].html_safe unless flash[type].blank?
      end
    end

    def flash_type
      [:error, :warning, :notice, :success].each do |type|
        return type unless flash[type].blank?
      end
    end
  end
end



