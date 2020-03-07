host Figaro.env.domain
protocol Figaro.env.protocol

sitemap :site do

  # default per_page is 50.000 which is the specified maximum.
  # per_page 10

  url root_url, last_mod: DateTime.now, change_freq: 'daily', priority: 1
end

ping_with "https://#{host}/sitemap.xml"
