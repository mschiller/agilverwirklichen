source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '6.0.2.1'
gem 'rails-i18n'
gem 'bootsnap', require: false
gem 'puma'
gem 'mysql2'
gem 'webpacker'
#gem 'turbolinks', '~> 5'
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
gem 'ckeditor'

group :production, :staging do
  gem 'redis-rack-cache'
  gem 'rack-rewrite'
end

group :production, :development do
  gem 'dynamic_sitemaps', '2.0.0', github: 'lassebunk/dynamic_sitemaps'

  #gem 'rack-mini-profiler'
  #gem 'memory_profiler'
  #gem 'flamegraph'
  #gem 'stackprof'
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
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end
