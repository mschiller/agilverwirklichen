require 'libraries/enkoder'

module ApplicationHelper
  include Webpacker::Helper
  include ActionView::Helpers::Enkoder

  def request_prefix
    request.protocol+request.env['HTTP_HOST']
  end

  def favicon_link_pack_tag(source = "media/images/favicon.ico", options = {})
    tag("link", {
        rel: "shortcut icon",
        type: "image/x-icon",
        href: asset_pack_path(source, skip_pipeline: options.delete(:skip_pipeline))
    }.merge!(options.symbolize_keys))
  end

  def image_with_source_tag(image, image_options={})
    picture_tag(path_to_asset(image.url(:large)), image: image_options) do
      source_tag(srcset: path_to_asset(image.url(:huge)), media: '(min-width: 1281px)') + \
      source_tag(srcset: path_to_asset(image.url(:large)), media: '(min-width: 1013px)') + \
      source_tag(srcset: path_to_asset(image.url(:medium)), media: '(min-width: 481px)') + \
      source_tag(srcset: path_to_asset(image.url(:small)))
    end
  end

  def link_image_with_source_tag(srcset, link, link_class, image_options={})
    link_to link, class: link_class do
      image_with_source_tag(srcset, image_options={})
    end
  end

  require 'uri'

  def head_meta_tags(options)
    canonical_uri = URI(request.url)
    if Rails.env.production? and !([request.subdomain.strip!, canonical_uri.host].delete_if { |x| x.blank? }.join('.').eql? Figaro.env.domain)
      canonical_uri.host = Figaro.env.domain
      canonical_uri.query = nil unless @canonical_with_query
      canonical_uri.fragment = nil
    else
      canonical_uri = nil
    end

    display_meta_tags :site => Figaro.env.app_header,
                      title: content_for(:thredded_page_title) || options['page_title'] || @page_title || cms_fragment_content('title'),
                      description: options['page_description'] || @page_description || cms_fragment_content('description'),
                      keywords: @page_keywords.present? ? @page_keywords : cms_fragment_content('keywords'),
                      noindex: (cms_fragment_content('noindex').blank? and @page_noindex.blank?) ? nil : true,
                      nofollow: (cms_fragment_content('nofollow').blank? and @page_nofollow.blank?) ? nil : true,
                      og: { title: title, image: og_images },
                      canonical: canonical_uri,
                      separator: '-',
                      reverse: true
  end

  def og_images
    if @og_image
      generate_og_images([@og_image])
    elsif cms_fragment_content('social_media_images').class != String
      generate_og_images(cms_fragment_content('social_media_images'))
    else
      []
    end
  end

  #
  # Use this method as close to the opening <head> tag as possible on every page of your website.
  #
  def google_tag_manager_script_tag
    @container_id ||= Figaro.env.google_tag_manager_id

    return '' if @container_id.blank? or !Rails.env.production?

    <<-HTML.strip_heredoc.html_safe
        <!-- Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','#{@container_id}');</script>
        <!-- End Google Tag Manager -->
    HTML
  end

  private

  def generate_og_images(images)
    og_images = []
    images.each do |attachment|
      og_images << [request.protocol, request.host_with_port.downcase, url_for(attachment)].join()[/[^?]+/]
    end
    og_images
  end

  def default_header_image_path
    if cms_fragment_content('header_image_path').include?('/')
      header_image_with_source_tag(cms_fragment_content('header_image_path'), alt: (cms_fragment_content('description') + ' ' + Figaro.env.app_name), class: :full_width).html_safe
    else
      header_image_with_source_tag("/assets/header/#{cms_fragment_content('header_image_path')}", alt: (cms_fragment_content('description') + ' ' + Figaro.env.app_name), class: :full_width).html_safe
    end
  end
end
