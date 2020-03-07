atom_feed do |feed|
   feed.title(t('.title'))
   feed.updated(@news.first.start_datetime)
   @news.each do |news|
     feed.entry(news) do |entry|
       entry.title(news.title)
       entry.summary(news.short_description)
       entry.content(news.description, :type => 'html')
       entry.url(news_url(id: news.slug_or_id))
       entry.author do |author|
         author.surname news.author.try(:username) || 'admin'
       end
     end
   end
 end
