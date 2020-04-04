Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  ActiveAdmin.routes(self)

  get "/news/feed", to: "feeds#news", defaults: { format: "atom" }, as: "newsfeed"

  get "/kontakt", :to => "contact#new", :as => "contact"
  post "/kontakt", :to => "contact#create"

  authenticate :user do
    resources :profiles, only: [:show, :update] do
      match :change_password, via: [:get, :put]
    end
  end

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions" }

  get "/error_test", to: "errors#test", as: "error_test"
  get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap

  mount Thredded::Engine => "/forum"

  comfy_route :blog, path: "/blog"
  comfy_route :blog_admin, path: "/blog-admin"
  comfy_route :cms_admin, :path => "/cms"
  comfy_route :cms, path: "/", :sitemap => false

  root to: "cms_content#render_html"
end
