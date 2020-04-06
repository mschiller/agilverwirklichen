RAILS_ROOT = File.expand_path("../../", __FILE__)

require "figaro"
@figaro = Figaro
@figaro.application = @figaro::Application.new(environment: :development, path: File.join(RAILS_ROOT, "config", "application.yml"))
@figaro.load

task :tail_logs do
  on roles (:app) do
    tail "#{shared_path}/log/*.log"
  end
end

set :rbenv_type, :user
set :rbenv_ruby, "2.6.0"

set :application, @figaro.env.app_name
set :repo_url, @figaro.env.git_respository

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory
set :deploy_to, "~/servers/" + @figaro.env.app_name + "/production"
set :shared_path, "#{deploy_to}/shared"

# yarn
set :nvm_type, :user # or :system
set :nvm_node, "v7.10.0"
set :nvm_map_bins, %w{node npm yarn}

set :yarn_target_path, -> { release_path }
set :yarn_flags, "--production --silent --no-progress"    # default
set :yarn_roles, :all                                     # default
set :yarn_env_variables, {}

# Puma:
set :puma_worker, 2
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_bind, "unix:///#{shared_path}/tmp/sockets/puma.sock"
set :app_server_socket, "#{shared_path}/tmp/sockets/puma.sock"
set :puma_init_active_record, true

#set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails pumactl puma}
set :rbenv_roles, :all # default value

set :assets_roles, [:app]
set :git_enable_submodules, false
set :use_sudo, false

#set :log_level, :debug
set :pty, true

set :linked_files, %w{config/secrets.yml config/application.yml config/skylight.yml}
set :linked_dirs, %w{.bundle log tmp/pids tmp/cache tmp/sockets vendor/bundle
                     public/system public/sitemaps storage node_modules}

set :keep_releases, 20

set :user, "deploy"
set :ssh_options, {
  user: fetch(:user),
}

set :whenever_roles, -> { [:app] }
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
#require "whenever/capistrano"

namespace :cache do
  task :clear do
    on roles(:app) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, "rails cache:clear"
        end
      end
    end
  end
end

after "deploy", "cache:clear"
