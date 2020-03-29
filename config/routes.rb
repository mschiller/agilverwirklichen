Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  ActiveAdmin.routes(self)

  get "/news/feed", to: "feeds#news", defaults: { format: "atom" }, as: "newsfeed"

  post "/send_contact_form", to: "application#send_contact_form"

  authenticate :user do
    resources :profiles, only: [:show, :update] do
      match :change_password, via: [:get, :put]
    end
  end

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions" }

  get "/error_test", to: "errors#test", as: "error_test"
  get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap
  get "/kontakt" => "home#contact"

  mount Thredded::Engine => "/forum"
  mount Ckeditor::Engine => "/ckeditor"

  comfy_route :cms_admin, :path => "/cms"
  comfy_route :cms, path: "/", :sitemap => false

  root to: "cms_content#render_html"
end
