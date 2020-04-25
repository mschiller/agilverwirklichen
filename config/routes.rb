Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  ActiveAdmin.routes(self)

  # redirects old => new
  get "/blog-post/agilitaet-geschwindigkeit/" => redirect("/blog/2018/10/agilitaet-geschwindigkeit")
  get "/blog-post/gedanken-zu-3-gruende-warum-scrum-in-der-politik-nichts-zu-suchen-hat/" => redirect("/blog/2018/10/gedanken-zu-3-gruende-warum-scrum-in-der-politik-nichts-zu-suchen-hat")
  get "/blog-post/teambuilding-mit-market-of-skills/" => redirect("/blog/2018/6/teambuilding-mit-market-of-skills-workshop")
  get "/blog-post/gruendung-mit-hilfe-der-arbeitsagentur/" => redirect("/blog/2018/1/gruendung-mit-hilfe-der-arbeitsagentur")
  get "/blog-post/scrum-3-0-im-einsatz/" => redirect("/blog/2018/1/scrum-30-im-einsatz")
  get "/blog-post/the-next-big-thing-autonomous-self-organized-units-2/" => redirect("/blog/2017/10/the-next-big-thing-autonomous-self-organized-units-2")
  get "/blog-post/the-next-big-thing-autonomous-self-organized-units-1/" => redirect("/blog/2017/9/the-next-big-thing-autonomous-self-organized-units-1")

  get "/kontakt", :to => "contact#new", :as => "contact"
  post "/kontakt", :to => "contact#create"

  mount Conferences::API => "/"
  get "/klassenraum", :to => "conferences#classroom"

  authenticate :user do
    resources :profiles, only: [:show, :update] do
      match :change_password, via: [:get, :put]
    end
  end

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions" }

  get "/error_test", to: "errors#test", as: "error_test"
  get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap
  
  comfy_route :blog, path: "/blog"
  comfy_route :blog_admin, path: "/blog-admin"
  comfy_route :cms_admin, :path => "/cms"
  comfy_route :cms, path: "/", :sitemap => false

  root to: "cms_content#render_html"
end
