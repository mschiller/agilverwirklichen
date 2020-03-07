Rails.application.config.generators do |g|
  g.orm :active_record
  g.template_engine :slim
  g.stylesheets     false
  g.javascripts     false
  g.scaffold_controller :inherited_resources_controller
  g.form_builder :simple_form
end

Rails.application.config.active_storage.service = :local

Rails.application.config.generators.system_tests = nil

# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
Rails.application.config.time_zone = 'Berlin'

Rails.application.config.cells.with_assets = []

# custom Rails.application.config.rations
Rails.application.config.cache_default_time_in_minutes = 1440
Rails.application.config.allowed_attachments_file_types = %w(doc docx xls odt ods pdf rar zip tar swf svg)
Rails.application.config.allowed_image_file_types = %w(jpg jpeg png gif tiff, svg)

if Rails.env.production? or Rails.env.staging?
  Rails.application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301(%r{^/(.*)/$}, '/$1')
  end
end
