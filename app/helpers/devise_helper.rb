module DeviseHelper
  def devise_error_messages!
    #   if resource.errors.full_messages.any?
    #     flash.now[:error] = resource.errors.full_messages
    #   end
    #   return ''

    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map {|msg| content_tag(:li, msg)}.join

    html = <<-HTML
    <div id="error_explanation">
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end