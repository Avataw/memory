defmodule MemoryWeb.GameController do
  use MemoryWeb, :controller
  alias Memory.Highscores

  def play(conn, _params) do
    cards =
      ["python", "java", "c", "ruby", "javascript", "haskell", "go", "rust"]
      |> Enum.flat_map(&Memory.Card.new_pair/1)
      |> Enum.shuffle()

    render(conn, :game, cards: cards)
  end

  def score(conn, %{"name" => name, "clicks" => clicks, "time" => time}) do
    case Highscores.create_highscore(%{
           "name" => name,
           "clicks" => clicks,
           "time" => time
         }) do
      {:ok, _highscore} ->
        Phoenix.PubSub.broadcast(Memory.PubSub, "highscores:updates", :updated)

        conn
        |> put_flash(:info, "Score saved successfully!")
        |> send_resp(200, "Score saved successfully!")

      {:error, changeset} ->
        IO.inspect(changeset)

        conn
        |> put_flash(:error, "Failed to save score.")
        |> send_resp(
          400,
          "Failed to save score"
        )
    end
  end
end
