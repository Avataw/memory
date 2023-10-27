defmodule MemoryWeb.PageController do
  use MemoryWeb, :controller

  def home(conn, _params) do
    conn
    |> put_flash(:error, "Let's pretend we have an error.")
    |> redirect(to: ~p"/redirect_test")
  end

  def redirect_test(conn, _params) do
    render(conn, :home, layout: false)
  end
end
