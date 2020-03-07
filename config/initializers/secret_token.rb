Rails.application.config.secret_token = Figaro.env.session_secret_token
Rails.application.config.secret_key_base = Figaro.env.session_secret_token
