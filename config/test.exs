import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :probuild_ex, ProbuildEx.Repo,
  username: "postgres",
  password: "resurrect",
  hostname: "localhost",
  database: "probuild_ex_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :probuild_ex, ProbuildExWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ubiKBL48t6DzfYxCWE9+sI8kn4gtDQYUKi3t0oThyOSDTVLoj1qjcbIKIj5gX84H",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Disable canon during tests
config :probuild_ex, :canon,
  games: [platform_ids: []],
  pros: [platform_ids: []]
