Rails.configuration do |config|
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default :charset => "utf-8"
end

ActionMailer::Base.sendmail_settings = {
    #:location       => '/usr/sbin/sendmail',
    #:arguments      => '-i -t -f ' + Figaro.env.email
}

ActionMailer::Base.smtp_settings = {
    address: Figaro.env.mail_smtp_address,
    port: Figaro.env.mail_smtp_port,
    domain: Figaro.env.domain,
    user_name: Figaro.env.mail_smtp_username,
    password: Figaro.env.mail_smtp_password,
    authentication: Figaro.env.mail_smtp_authentication,
    enable_starttls_auto: true
}

if Rails.env.staging?
  class DevelopmentMailInterceptor
    def self.delivering_email(message)
      message.subject = "[#{message.to}] #{message.subject}"
      message.to = Figaro.env.mail_default_to
    end
  end

  Mail.register_interceptor(DevelopmentMailInterceptor)
end