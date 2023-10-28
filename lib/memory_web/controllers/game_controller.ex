defmodule MemoryWeb.GameController do
  use MemoryWeb, :controller

  def play(conn, _params) do
    cards =
      ["python", "java", "c", "ruby", "javascript", "haskell", "go", "rust"]
      |> Enum.flat_map(&Memory.Card.new_pair/1)
      |> Enum.shuffle()

    render(conn, :game, cards: cards)
  end
end
