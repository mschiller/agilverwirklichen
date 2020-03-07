unless defined? ENV['JAVA_LIBRARY_PATH']
  require "active_support/json/backends/jsongem"
  ActiveSupport::JSON.backend = ActiveSupport::JSON::Backends::JSONGem
end
