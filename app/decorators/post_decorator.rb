class PostDecorator < Draper::Decorator
  delegate_all

  def index_content(length = nil)
    text = Sanitize.fragment(content_cache, elements: %w()).strip[0..(length || 250)]
    text.strip[0..(text.rindex(".") || text.rindex(" ") || text.rindex(",")).to_i] + " ..."
  end
end
