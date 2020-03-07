module PaginationMethods
  extend ActiveSupport::Concern

  included do

    protected

    def collection
      # paginating workaround in work with inherited_resources
      resources ||= end_of_association_chain.page params[:page]
    end

  end
end






