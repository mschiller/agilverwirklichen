class ContactForm
  include ActiveModel::Validations

  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :content, presence: true

  # to deal with form, you must have an id attribute
  attr_accessor :id, :email, :telephone, :content

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_key
  end

  def persisted?
    true
  end

  def save
    if self.valid?
      Notifier.contact_form_notification(self.email, self.telephone, self.content).deliver_later
      return true
    end
    return false
  end
end
