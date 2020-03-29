class Notifier < ActionMailer::Base
  default :from => Figaro.env.email
  layout "mailer"

  def contact_form_notification(email, telephone, content)
    @from_email = email
    @from_telephone = telephone
    @mail_content = content
    @datetime = l(DateTime.now, format: :long)
    mail(to: Figaro.env.notifications_recipients,
         subject: t("message.contact_form.subject", from_email: @from_email,
                                                    from_telephone: @from_telephone, datetime: @datetime))
  end
end
