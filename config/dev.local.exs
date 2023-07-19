import Config

# put your token below
config :probuild_ex, ProbuildEx.RiotApi, token: "RGAPI-c716f5bc-eb52-47f6-ac8c-f84a818e815f"

# since tesla and ecto_sql are deps don't forget to recompile them if you want to turn on / off their logs
# mix deps.compile --force tesla ecto_sql
config :logger,
  backends: [:console],
  compile_time_purge_matching: [
    [application: :ecto_sql],
    [application: :tesla],
    [module: ProbuildEx.Canon.Games]
  ]
