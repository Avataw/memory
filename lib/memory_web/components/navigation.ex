defmodule MemoryWeb.Navigation do
  use MemoryWeb, :html

  attr :path, :string, required: true

  def navigation(assigns) do
    ~H"""
    <header class="text-white py-4 px-8 flex items-center justify-between">
      <h1 class="text-2xl font-bold">memory_leak</h1>
      <nav>
        <.link navigate={~p"/"} class={get_class(@path, "home")}>
          home
        </.link>
        <.link navigate={~p"/game"} class={get_class(@path, "game")}>
          game
        </.link>
        <.link navigate={~p"/highscore"} class={get_class(@path, "highscore")}>
          highscore
        </.link>
      </nav>
    </header>
    """
  end

  defp get_class(path, link) do
    if path == link do
      "text-white px-4 font-bold"
    else
      "text-gray-300 hover:text-white px-4"
    end
  end
end
