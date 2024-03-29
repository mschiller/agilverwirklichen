# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |p|
  p.default_src :self, :https
  p.font_src    :self, :https, :data
  p.img_src     :self, :https, :data
  p.object_src  :none
  p.script_src  :self, :https, :unsafe_eval, :unsafe_inline
  p.style_src   :self, :https, :unsafe_inline
  p.frame_src   :self, :https, 'http://www.loadmill.com'

  # Specify URI for violation reports
  # p.report_uri "/csp-violation-report-endpoint"

  p.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035' if Rails.env.development?
end

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
