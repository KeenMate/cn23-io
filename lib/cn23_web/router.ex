defmodule Cn23Web.Router do
  use Cn23Web, :router
  use Pow.Phoenix.Router
  use PowAssent.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_layout, {Cn23Web.LayoutView, "pages/pages.html"}
    # plug :put_root_layout, {Cn23Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :locale do
    plug SetLocale,
      gettext: Cn23Web.Gettext,
      default_locale: "en",
      additional_locales: ["cs", "de"],
      cookie_key: "cn23_locale"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :skip_csrf_protection do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Cn23Web.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: Cn23Web.AuthErrorHandler
  end

  scope "/", Cn23Web do
    pipe_through [:browser, :locale]

    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :skip_csrf_protection

    pow_assent_authorization_post_callback_routes()
  end

  scope "/" do
    pipe_through [:browser]

    pow_assent_routes()
  end

  scope "/:locale", Cn23Web do
    pipe_through [:browser, :not_authenticated, :locale]

    get "/signup", SignupController, :signup_page
    post "/signup", SignupController, :signup
    get "/login", LoginController, :login_page
    post "/login", LoginController, :login
  end

  scope "/:locale", Cn23Web do
    pipe_through [:browser, :protected, :locale]

    get "/logout", LoginController, :logout
  end

  scope "/:locale", Cn23Web do
    pipe_through [:browser, :locale]

    get "/", PageController, :index
    get "/news", NewsController, :news
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cn23Web do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: Cn23Web.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
