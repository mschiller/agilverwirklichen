# encoding: utf-8

ComfortableMexicanSofa.configure do |config|
  # Title of the admin area
  config.cms_title = 'CMS | ' + Figaro.env.app_name.to_s

  # Controller that is inherited from CmsAdmin::BaseController
  #config.base_controller = 'ApplicationController'

  # Module responsible for authentication. You can replace it with your own.
  # It simply needs to have #authenticate method. See http_auth.rb for reference.
  config.admin_auth = 'Framework::DeviseAuth'

  # Module responsible for public authentication. Similar to the above. You also
  # will have access to @cms_site, @cms_layout, @cms_page so you can use them in
  # your logic. Default module doesn't do anything.
  #   config.public_auth = 'ComfyPublicAuthentication'

  # Module responsible for public authorization. It should have #authorize
  # method that returns true or false based on params and loaded instance
  # variables available for a given controller.
  #   config.public_authorization = 'ComfyPublicAuthorization'

  # When arriving at /cms-admin you may chose to redirect to arbirtary path,
  # for example '/cms-admin/users'
  #   config.admin_route_redirect = ''

  # Sofa allows you to setup entire site from files. Database is updated with each
  # request (if necessary). Please note that database entries are destroyed if there's
  # no corresponding file. Seeds are disabled by default.
  #   config.enable_seeds = false

  # Path where seeds can be located.
  #   config.seeds_path = File.expand_path('db/cms_seeds', Rails.root)

  # Content for Layouts, Pages and Snippets has a revision history. You can revert
  # a previous version using this system. You can control how many revisions per
  # object you want to keep. Set it to 0 if you wish to turn this feature off.
  config.revisions_limit = 50

  # Locale definitions. If you want to define your own locale merge
  # {:locale => 'Locale Title'} with this.
  config.locales = {:de => 'Deutsch'}

  # Admin interface will respect the locale of the site being managed. However you can
  # force it to English by setting this to `:en`
  config.admin_locale = :de

  # If you want to keep your CMS tables in a location other than the default database
  # add a database_config. For example, setting it to 'cms' will look for a cms_#{Rails.env}
  # definition in your database.yml file
  #   config.database_config = nil

  # A class that is included as a sweeper to admin base controller if it's set
  #   config.admin_cache_sweeper = nil

  # By default you cannot have irb code inside your layouts/pages/snippets.
  # Generally this is to prevent putting something like this:
  # <% User.delete_all %> but if you really want to allow it...
  config.allow_erb = true

  # Whitelist of all helper methods that can be used via {{cms:helper}} tag. By default
  # all helpers are allowed except `eval`, `send`, `call` and few others. Empty array
  # will prevent rendering of all helpers.
  config.allowed_helpers = %w(cell)

  # Whitelist of partials paths that can be used via {{cms:partial}} tag. All partials
  # are accessible by default. Empty array will prevent rendering of all partials.
  #   config.allowed_partials = nil

  # Site aliases, if you want to have aliases for your site. Good for harmonizing
  # production env with dev/testing envs.
  # e.g. config.hostname_aliases = {'host.com' => 'host.inv', 'host_a.com' => ['host.lvh.me', 'host.dev']}
  # Default is nil (not used)
  #   config.hostname_aliases = nil

  # Reveal partials that can be overwritten in the admin area.
  # Default is false.
  #   config.reveal_cms_partials = false
end

# Default credentials for ComfortableMexicanSofa::AccessControl::AdminAuthentication
# YOU REALLY WANT TO CHANGE THIS BEFORE PUTTING YOUR SITE LIVE
#ComfortableMexicanSofa::AccessControl::AdminAuthentication.username = "username"
#ComfortableMexicanSofa::AccessControl::AdminAuthentication.password = "password"

module Framework::DeviseAuth
  def authenticate
    ability = Ability.new(current_user || User.new)
    return true if ability.can?(:manage, "Cms::Site")

    raise CanCan::AccessDenied
  end
end

# Uncomment this module and `config.admin_auth` above to use custom admin authentication
# module ComfyAdminAuthentication
#   def authenticate
#     return true
#   end
# end

# Uncomment this module and `config.admin_authorization` above to use custom admin authorization
# module ComfyAdminAuthorization
#   def authorize
#     return true
#   end
# end

# Uncomment this module and `config.public_auth` above to use custom public authentication
# module ComfyPublicAuthentication
#   def authenticate
#     return true
#   end
# end

# Uncomment this module and `config.public_authorization` above to use custom public authorization
# module ComfyPublicAuthorization
#   def authorize
#     return true
#   end
# end
