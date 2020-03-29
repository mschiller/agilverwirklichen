class ContactController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if verify_rucaptcha? && @contact_form.save
      flash.now[:success] = t("message.contact_form.send_info").html_safe
      render :new
    else
      flash.now[:notice] = t("message.contact_form.send_error").html_safe
      render :new
    end
  end
end
