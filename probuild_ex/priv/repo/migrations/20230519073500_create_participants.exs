defmodule ProbuildEx.Repo.Migrations.CreateParticipants do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :assists, :integer
      add :champion_id, :integer
      add :deaths, :integer
      add :gold_earned, :integer
      add :items, {:array, :integer}
      add :kills, :integer
      add :summoners, {:array, :integer}
      add :team_position, :string
      add :team_id, :integer
      add :win, :boolean, default: false, null: false
      add :game_id, references(:games, on_delete: :nothing)
      add :summoner_id, references(:summoners, on_delete: :nothing)
      add :opponent_participant_id, references(:participants, on_delete: :nothing)

      timestamps()
    end

    create index(:participants, [:game_id])
    create index(:participants, [:summoner_id])
    create index(:participants, [:opponent_participant_id])
  end
end
