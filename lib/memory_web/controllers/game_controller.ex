defmodule MemoryWeb.GameController do
  use MemoryWeb, :controller

  def play(conn, _params) do
    render(conn, :game)
  end
end
