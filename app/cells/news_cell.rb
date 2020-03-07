class NewsCell < Cell::ViewModel
  cache :show do
    [News.order('updated_at ASC').last.updated_at.to_s]
  end

  def show(options={})
    @start_page_list = News.published.order('news.start_datetime DESC').all
    render
  end
end
