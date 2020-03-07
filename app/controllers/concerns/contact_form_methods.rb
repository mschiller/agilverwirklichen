module ContactFormMethods
  extend ActiveSupport::Concern
  include AjaxFlashMethods

  included do
    def send_contact_form
      @contact_form = ContactForm.new(params[:contact_form])
      if verify_rucaptcha? && @contact_form.save
        flash.now[:success] = t('message.contact_form.send_info').html_safe
        render js: 'document.getElementById("edit_contact_form").reset();'
      else
        flash.now[:notice] =  t('message.contact_form.send_error').html_safe
      end
    end
  end
end
