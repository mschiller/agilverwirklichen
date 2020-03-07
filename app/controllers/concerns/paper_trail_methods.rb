module PaperTrailMethods
  extend ActiveSupport::Concern

  included do
    # Returns any information about the controller or request that you want
    # PaperTrail to store alongside any changes that occur.
    def info_for_paper_trail
      super
      #{ ip: request.remote_ip, user_agent: request.user_agent }
    end

    # Returns the user who is responsible for any changes that occur.
    # Defaults to current_user.
    def user_for_paper_trail
      super
      #logged_in? ? current_user : 'Public user'  # or whatever
    end
  end
end






