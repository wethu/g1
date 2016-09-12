# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

# General application configuration
config :g1,
  ecto_repos: [G1.Repo]

# Configures the endpoint
config :g1, G1.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CyTVFl6drS6RdA47IK7K+FiwNyUP3EsITDO5M23yaTiKJ5pjNGbSruv9lWgKQq6I",
  render_errors: [view: G1.ErrorView, accepts: ~w(html json)],
  pubsub: [name: G1.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
