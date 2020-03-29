class HomeController < ApplicationController
  include RuCaptcha::ViewHelpers

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    render "home/robots.text.erb"
  end

  def newsletter
    render
  end

  def contact
    @contact_form = ContactForm.new
    render
  end

  def send_contact_form
    @contact_form = ContactForm.new(params[:contact_form])
    if verify_rucaptcha? && @contact_form.save
      flash.now[:success] = t("message.contact_form.send_info").html_safe
      render js: 'document.getElementById("edit_contact_form").reset();'
    else
      flash.now[:notice] = t("message.contact_form.send_error").html_safe
    end
  end

  def import
    Customer.reset_newsletter_flag
    CustomerImporter.new.update_customers
    render text: "DONE"
  end
end
