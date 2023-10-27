defmodule MemoryWeb.GameController do
  use MemoryWeb, :controller

  def index(conn, _params) do
    render(conn, :game)
  end

  def play(conn, %{"name" => name}) do
    conn
    |> put_root_layout(html: false)
    |> render(:game, name: name)
  end
end
