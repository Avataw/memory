defmodule Memory.Highscores.Highscore do
  use Ecto.Schema
  import Ecto.Changeset

  schema "highscores" do
    field :name, :string
    field :time, :integer
    field :clicks, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(highscore, attrs) do
    highscore
    |> cast(attrs, [:name, :time, :clicks])
    |> validate_required([:name, :time, :clicks])
  end
end
