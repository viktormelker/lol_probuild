defmodule ProbuildEx.Repo.Migrations.CreateSummoners do
  use Ecto.Migration

  def change do
    create table(:summoners) do
      add :name, :text
      add :puuid, :text
      add :platform_id, :string
      add :pro_id, references(:pros, on_delete: :nothing)

      timestamps()
    end

    create index(:summoners, [:pro_id])
  end
end
