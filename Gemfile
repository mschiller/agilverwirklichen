source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'rails-i18n'
gem 'bootsnap', require: false
gem 'puma'
gem 'mysql2'
gem 'webpacker'
gem 'sassc'
gem 'coffee-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jbuilder'
gem 'figaro'
gem 'cancancan'
gem 'paper_trail'
gem 'paperclip'
gem 'image_optim_rails'
gem 'image_optim_pack'
gem 'delayed_paperclip'
gem 'friendly_id'
gem 'devise'
gem 'activeadmin'
gem 'arctic_admin'
gem 'ckeditor'
gem 'simple_form'
gem 'slim-rails'
gem 'mini_racer'
gem 'active_storage_validations'
gem 'validates_timeliness'
gem 'valid_email'
gem 'url_validator'
gem 'active_attr'
gem 'reform-rails'
gem 'whenever'
gem 'mobile-fu'
gem 'sanitize'
gem 'meta-tags'
gem 'picture_tag'
gem 'redis-rails'
gem 'rails-assets-picturefill', source: 'https://rails-assets.org'
gem 'comfortable_mexican_sofa'
gem 'responders'
gem 'cells-rails'
gem 'cells-slim'
gem 'http_accept_language'
gem 'rack-protection'
gem 'kaminari'
gem 'navigasmic'
gem 'draper'
gem 'browser'
gem 'dotenv-rails'
gem 'rucaptcha'
gem 'exception_notification'
gem "skylight"
gem 'thredded'
gem 'mini_magick'
gem 'image_processing'
gem 'httparty', require: nil
gem 'rollbar'

#gem 'spree'#, '~> 3.7.0.rc1'
#gem 'spree_auth_devise'#, '~> 3.4'
#gem 'spree_gateway'#, '~> 3.4'
#gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
#gem 'spree_mail_settings', github: 'spree-contrib/spree_mail_settings'
#gem 'spree_paypal_express', github: 'spree-contrib/better_spree_paypal_express'
#gem 'spree_digital', github: 'spree-contrib/spree_digital'
#gem 'spree_mollie_gateway'
#gem 'spree_minecraft', path: '../spree_minecraft'

group :production, :staging do
  gem 'redis-rack-cache'
  gem 'rack-rewrite'
end

group :production, :development do
  gem 'dynamic_sitemaps', '2.0.0', github: 'lassebunk/dynamic_sitemaps'

  gem 'rack-mini-profiler'
  gem 'memory_profiler'
  gem 'flamegraph'
  gem 'stackprof'
end

group :development do
  gem 'letter_opener_web'
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-rbenv'
  gem 'capistrano-yarn'
  gem 'airbrussh'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.1.5', '< 3.2'
  gem 'launchy'
  gem 'bullet'
  gem 'solargraph'
  gem 'rufo'

  # rubymine
  unless defined? ENV['JAVA_LIBRARY_PATH']
    gem 'debugger'
  end
  gem 'pry-rails'
  gem 'pry-rescue'
end
