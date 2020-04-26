host Figaro.env.domain

sitemap :site do

  # default per_page is 50.000 which is the specified maximum.
  # per_page 10

  url root_url, last_mod: DateTime.now, change_freq: "weekly", priority: 0.9

  Comfy::Blog::Post.published.each do |post|
    url ["https:", post.url].join(), last_mod: post.updated_at, change_freq: "daily", priority: 1
  end

  Comfy::Cms::Site.first.pages.root.children.published.each do |page|
    url ['https:', page.url].join(), last_mod: page.updated_at, change_freq: "monthly", priority: 0.5
  end
end

ping_with "https://#{host}/sitemap.xml"
