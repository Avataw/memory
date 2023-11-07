defmodule MemoryWeb.HighscoreLive do
  use Phoenix.LiveView
  alias Memory.Highscores

  def mount(_params, _session, socket) do
    highscores =
      Highscores.list_highscores() |> IO.inspect()

    Phoenix.PubSub.subscribe(Memory.PubSub, "highscores:updates")

    {:ok, assign(socket, highscores: highscores)}
  end

  def handle_info(:updated, socket) do
    # Fetch the updated list of highscores
    highscores = Memory.Highscores.list_highscores()
    # Update the socket's state
    {:noreply, assign(socket, highscores: highscores)}
  end

  def handle_event(
        "score_update",
        attrs,
        socket
      ) do
    IO.inspect(attrs)
    Highscores.create_highscore(attrs)
    {:noreply, socket}
  end
end
