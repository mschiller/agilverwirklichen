# Load DSL and Setup Up Stages
require "capistrano/setup"

# Includes default deployment tasks
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Includes tasks from other gems included in your Gemfile
require "capistrano/rails"
require "capistrano/bundler"
require "capistrano/rbenv"
require "capistrano/puma"
require "capistrano/yarn"
require "whenever/capistrano"

install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Daemon  # If you using puma daemonized (not supported in Puma 5+)
#install_plugin Capistrano::Puma::Systemd  # if you use SystemD 
