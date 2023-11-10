defmodule MemoryWeb.GameController do
  use MemoryWeb, :controller
  alias Memory.Highscores

  def play(conn, _params) do
    cards =
      ["python", "java", "c", "ruby", "javascript", "haskell", "go", "rust"]
      |> Enum.flat_map(&Memory.Card.new_pair/1)
      |> Enum.shuffle()

    render(conn, :game, cards: cards, layout: false)
  end

  def score(conn, %{"name" => name, "clicks" => clicks, "time" => time}) do
    Highscores.create_highscore(%{
      "name" => name,
      "clicks" => clicks,
      "time" => time
    })

    conn
    |> send_resp(200, "Score was saved successfully")
  end
end
