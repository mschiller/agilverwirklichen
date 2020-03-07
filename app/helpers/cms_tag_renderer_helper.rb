module CmsTagRendererHelper

  def replace_tags(content)

    @cms_site ||= cms_site_detect

    renderer = ComfortableMexicanSofa::Content::Renderer.new(content)
    tokens = renderer.nodes(renderer.tokenize(content))

    tokens.reject {|c| c.class == String}.each do |token|

      if token.class == ComfortableMexicanSofa::Content::Tag::FileLink
        if (file = @cms_site&.files&.where(id: token.params)&.first)
          if token.as == 'image'
            height, width = get_image_tag_params(token)
            content.sub! token.source, image_tag(rails_blob_path(file.attachment), width: width, height: height)
          else
            content.sub! token.source, rails_blob_path(file.attachment)
          end
        end

      elsif token.class == ComfortableMexicanSofa::Content::Tag::Snippet
        content.sub! token.source, cms_snippet_content(token.params.flatten, @cms_site)

      elsif token.class == ComfortableMexicanSofa::Content::Tag::Helper
        content.sub! token.source, cms_snippet_content(token.params.flatten, @cms_site)
      end
    end

    content.html_safe
  end

  private

  def get_image_tag_params(token)
    token_params = token.source.gsub(/\s+/, "").tr('{{', '').tr('}}', '').split(',').map {|x| x = x.split(":"); Hash[x.first.to_sym, x.last]}
    width_array = token_params.select {|t| t[:width]}
    width = width_array.first[:width].tr("''", '') if width_array.size > 0
    height_array = token_params.select {|t| t[:height]}
    height = height_array.first[:height].tr("''", '') if height_array.size > 0
    return height, width
  end

  def cms_site_detect
    host = request.host_with_port.downcase
    path = request.fullpath
    Comfy::Cms::Site.find_site(host, path)
  end

end
