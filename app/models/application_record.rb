class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include ActionText::Attribute
end
