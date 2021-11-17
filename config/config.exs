# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :cn23,
  page_title: "CN23.io",
  title_separator: "・"

config :cn23, Cn23Web.Gettext,
  locales: ~w(en cs de),
  default_locale: "en"

config :cn23, :pow,
  user: Cn23.Users.User,
  repo: Cn23.Repo,
  web_module: Cn23Web

config :cn23, :pow_assent,
  user_identities_context: Octoro.UserIdentities.Context,
  providers: [
    github: [
      icon: "fab fa-github"
    ],
    zuubr: [
      icon: "fas fa-jedi"
    ]
  ]

config :cn23,
  ecto_repos: [Cn23.Repo]

# Configures the endpoint
config :cn23, Cn23Web.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Cn23Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cn23.PubSub,
  live_view: [signing_salt: "2CCwp25L"]

config :ecto_gen,
  otp_app: :cn23,
  db_config: Cn23.Repo,
  # relative path should be relative to the project root
  output_location: "lib/cn23/database",
  # Module prefix that will be used for generated content
  output_module: "Cn23.Database",

  # This config holds information about what routines (funcs) from database will have generated elixir functions etc.
  # db project has keys, each representing database's schema which has config for what routines it includes/ingores
  db_project: [
    public: [
      # or ["func_name_1", "func_name_2"]
      funcs: "*"

      # makes sense to specify ignored functions (routines) only when funcs equal "*"
      # ignored_funcs: ["ignored_func_name_1"]
    ]
  ]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :cn23, Cn23.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
