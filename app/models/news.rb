class News < ActiveRecord::Base
  #extend FriendlyId

  #has_paper_trail

  #belongs_to :author, class_name: 'User'

  scope :published, -> { where(
      self.arel_table[:start_datetime].lt(DateTime.now)
      .and(self.arel_table[:end_datetime].gt(DateTime.now)
           .or(self.arel_table[:end_datetime].eq(nil)
           )
      )
  )}

  paginates_per 15
  #friendly_id :title, use: :slugged

  validates :title, :short_description, presence: true

  #before_validation { self.author_id = User.current_user.id unless self.author_id }

  def slug_or_id
    slug || id
  end

  def view_description(lenght=nil)
    text = Sanitize.fragment(description, elements: %w()).strip[0..(lenght || 250)]
    (text.strip[0..text.rindex(' ').to_i] + ' ...').html_safe
  end
end
