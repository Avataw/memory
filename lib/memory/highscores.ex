defmodule Memory.Highscores do
  @moduledoc """
  The Highscores context.
  """

  import Ecto.Query, warn: false
  alias Memory.Repo

  alias Memory.Highscores.Highscore

  @doc """
  Returns the list of highscores.

  ## Examples

      iex> list_highscores()
      [%Highscore{}, ...]

  """
  def list_highscores do
    Repo.all(Highscore)
  end

  @doc """
  Gets a single highscore.

  Raises `Ecto.NoResultsError` if the Highscore does not exist.

  ## Examples

      iex> get_highscore!(123)
      %Highscore{}

      iex> get_highscore!(456)
      ** (Ecto.NoResultsError)

  """
  def get_highscore!(id), do: Repo.get!(Highscore, id)

  @doc """
  Creates a highscore.

  ## Examples

      iex> create_highscore(%{field: value})
      {:ok, %Highscore{}}

      iex> create_highscore(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_highscore(attrs \\ %{}) do
    %Highscore{}
    |> Highscore.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a highscore.

  ## Examples

      iex> update_highscore(highscore, %{field: new_value})
      {:ok, %Highscore{}}

      iex> update_highscore(highscore, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_highscore(%Highscore{} = highscore, attrs) do
    highscore
    |> Highscore.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a highscore.

  ## Examples

      iex> delete_highscore(highscore)
      {:ok, %Highscore{}}

      iex> delete_highscore(highscore)
      {:error, %Ecto.Changeset{}}

  """
  def delete_highscore(%Highscore{} = highscore) do
    Repo.delete(highscore)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking highscore changes.

  ## Examples

      iex> change_highscore(highscore)
      %Ecto.Changeset{data: %Highscore{}}

  """
  def change_highscore(%Highscore{} = highscore, attrs \\ %{}) do
    Highscore.changeset(highscore, attrs)
  end
end
