I18n.default_locale = :de
I18n.available_locales = [:de, :en]
I18n.load_path += Dir[Rails.application.config.root.join('config', 'locales', '**', '*.{rb,yml}')]
