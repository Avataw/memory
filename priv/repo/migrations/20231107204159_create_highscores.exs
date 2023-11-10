defmodule Memory.Repo.Migrations.CreateHighscores do
  use Ecto.Migration

  def change do
    create table(:highscores) do
      add :name, :string
      add :time, :integer
      add :clicks, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
