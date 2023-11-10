defmodule MemoryWeb.PageController do
  use MemoryWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
