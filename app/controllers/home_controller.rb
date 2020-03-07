class HomeController < ApplicationController
  def sitemap
    path = Rails.root.join('public', 'sitemaps', 'sitemap.xml')
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: 'Sitemap not found.', status: :not_found
    end
  end

  def robots
    render 'home/robots.text.erb'
  end

  def newsletter
    render
  end

  def import
    Customer.reset_newsletter_flag
    CustomerImporter.new.update_customers
    render text: 'DONE'
  end
end
