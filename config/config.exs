# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :whats_up,
  ecto_repos: [WhatsUp.Repo]

config :whats_up_web,
  ecto_repos: [WhatsUp.Repo],
  generators: [context_app: :whats_up]

# Configures the endpoint
config :whats_up_web, WhatsUpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BqCLlqRhBeH6E9tAR4tY/dB2ssrNoFEH64NrUtnDWCoridrn0JchB8WC1KX4tVGG",
  render_errors: [view: WhatsUpWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WhatsUp.PubSub,
  live_view: [signing_salt: "yXX/5+fP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
