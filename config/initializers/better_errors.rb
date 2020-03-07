if Rails.env.development?
  # http://rubydoc.info/github/charliesome/better_errors/master/BetterErrors.editor=
  BetterErrors.editor = :sublime #proc { |file, line|
  #  "my-editor://open?url=#{URI.encode_www_form_component file}&line=#{line}"
  #}
end