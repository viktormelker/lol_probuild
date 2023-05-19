defmodule ProbuildEx.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :creation, :utc_datetime
      add :duration, :integer
      add :platform_id, :string
      add :riot_id, :text
      add :version, :text
      add :winner, :integer

      timestamps()
    end

    create unique_index(:games, [:riot_id])
  end
end
