defmodule MemoryWeb.GameController do
  use MemoryWeb, :controller

  def start(conn, _params) do
    render(conn, "show.html")
  end
end
