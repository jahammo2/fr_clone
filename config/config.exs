# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fr_clone,
  ecto_repos: [FrClone.Repo]

# Configures the endpoint
config :fr_clone, FrCloneWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LWJrjoNWxZ36BO6CO3ArcbGXEUKHLR7NQOiCnqoynLbusT5yGaEEi/F7m63SPNY5",
  render_errors: [view: FrCloneWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FrClone.PubSub,
  live_view: [signing_salt: "D5RuS/Mv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
