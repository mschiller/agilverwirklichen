module TextHelperModule
  extend ActiveSupport::Concern

  included do
    def view_description(length = 250)
      text = Sanitize.fragment(description, elements: %w(a strong div span)).strip[0..(length)]
      (text.strip[0..(text.size < length ? text.size : text.rindex(' ').to_i)] + ' ...').html_safe
    end
  end
end
