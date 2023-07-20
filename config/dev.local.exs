import Config

# put your token below
config :probuild_ex, ProbuildEx.RiotApi, token: "RGAPI-a32284f8-8fb4-4316-9826-2821f2c00024"

# since tesla and ecto_sql are deps don't forget to recompile them if you want to turn on / off their logs
# mix deps.compile --force tesla ecto_sql
config :logger,
  backends: [:console],
  compile_time_purge_matching: [
    [application: :ecto_sql],
    [application: :tesla],
    [module: ProbuildEx.Canon.Games]
  ]
