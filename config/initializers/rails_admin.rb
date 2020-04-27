require "rails_admin/seconds"

RailsAdmin.config do |config|
  config.current_user_method { current_user }
  config.main_app_name = Proc.new { |controller| [Figaro.env.app_header, "Admin - " + controller.params["action"].titleize] }
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.authorize_with :cancancan, Ability
  config.included_models = %w(Role ) #User Reference
  #config.audit_with :paper_trail, "User", "PaperTrail::Version"
  config.compact_show_view = true

  PAPER_TRAIL_AUDIT_MODEL = %w()

  config.models do
    list do
      sort_by :created_at
      sort_reverse true
      field :created_at
    end
    fields_of_type :datetime do
      strftime_format "%d.%m.%Y"
    end
  end

  ## == Gravatar integration ==
  config.show_gravatar = false

  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    clone
    delete
    #show_in_app
    history_index do
      only PAPER_TRAIL_AUDIT_MODEL
    end
    history_show do
      only PAPER_TRAIL_AUDIT_MODEL
    end
  end
end
