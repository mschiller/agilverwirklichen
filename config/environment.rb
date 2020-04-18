# Load the Rails application.
require_relative 'application'

if Rails.env.development?
  projectrc = File.expand_path("../../.railsrc", __FILE__)
  if File.exist?(projectrc)
    load projectrc
  end
end

# Initialize the Rails application.
Rails.application.initialize!
