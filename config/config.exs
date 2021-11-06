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

config :cn23, :pow,
  user: Cn23.Users.User,
  repo: Cn23.Repo,
  web_module: Cn23Web

config :cn23, :pow_assent,
  user_identities_context: Octoro.UserIdentities.Context,
  providers: [
    github: [
      icon: "fab fa-github",
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
