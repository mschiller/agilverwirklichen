# Load the rails application
require File.expand_path('../application', __FILE__)

if Rails.env.development?
  projectrc = File.expand_path('../../.railsrc', __FILE__)
  if File.exist?(projectrc)
    load projectrc
  end
end

# Initialize the rails application
Framework::Application.initialize!
