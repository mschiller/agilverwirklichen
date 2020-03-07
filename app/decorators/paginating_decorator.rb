class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :model_name, :total_count, :next_page, :prev_page
end