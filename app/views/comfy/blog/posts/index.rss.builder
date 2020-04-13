# frozen_string_literal: true

xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title Figaro.env.app_header
    xml.description Figaro.env.app_header + " Blog"
    xml.link comfy_blog_posts_url(@cms_site.path)

    @blog_posts.each do |post|
      url = comfy_blog_post_url(@cms_site.path, post.year, post.month, post.slug)

      xml.item do
        xml.title post.title
        xml.description PostDecorator.decorate(post).index_content
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link url
        xml.guid url
      end
    end
  end
end
