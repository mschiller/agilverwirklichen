# vim: ft=ruby

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = true
Pry.plugins["doc"].activate!
Pry.config.editor = "mine" # rubymine support

#Pry.commands.alias_command 'c', 'continue'
#Pry.commands.alias_command 's', 'step'
#Pry.commands.alias_command 'n', 'next'

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end
