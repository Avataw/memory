defmodule MemoryWeb.HighscoreLive do
  use Phoenix.LiveView
  use MemoryWeb, :html

  def mount(_params, _session, socket) do
    Phoenix.PubSub.subscribe(Memory.PubSub, "highscores:updated")

    socket =
      socket
      |> assign(:query_name, Map.get(_params, "name", ""))
      |> assign(:highscores, get_highscores())

    {:ok, socket}
  end

  def handle_info(:updated, socket) do
    {:noreply, assign(socket, highscores: get_highscores())}
  end

  defp get_highscores() do
    Memory.Highscores.list_highscores()
    |> Enum.map(fn highscore ->
      %{
        name: highscore.name,
        clicks: highscore.clicks,
        time: highscore.time,
        score: calc_score(highscore),
        rank: nil
      }
    end)
    |> Enum.sort_by(fn highscore -> highscore.score end, :desc)
    |> Enum.with_index()
    |> Enum.map(fn {highscore, index} ->
      %{highscore | rank: get_rank(index)}
    end)
  end

  defp get_rank(index) do
    case index do
      0 -> "🥇"
      1 -> "🥈"
      2 -> "🥉"
      n -> n + 1
    end
  end

  defp calc_score(highscore) do
    (10000 / (highscore.time * 1.5 + highscore.clicks * 1.25)) |> Kernel.round()
  end
end
