class DeviseMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})
    mail = super
    mail.subject = "[#{Figaro.env.app_header}] " + mail.subject
    mail
  end

  def reset_password_instructions(record, token, opts={})
    mail = super
    mail.subject = "[#{Figaro.env.app_header}] " + mail.subject
    mail
  end

  def unlock_instructions(record, token, opts={})
    mail = super
    mail.subject = "[#{Figaro.env.app_header}] " + mail.subject
    mail
  end

  def email_changed(record, opts={})
    mail = super
    mail.subject = "[#{Figaro.env.app_header}] " + mail.subject
    mail
  end

  def password_change(record, opts={})
    mail = super
    mail.subject = "[#{Figaro.env.app_header}] " + mail.subject
    mail
  end
end