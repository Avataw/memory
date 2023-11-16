defmodule MemoryWeb.GameLive do
  use Phoenix.LiveView
  use MemoryWeb, :html

  import MemoryWeb.Navigation

  def mount(_params, _session, socket) do
    {:ok, assign(socket, cards: get_cards())}
  end

  def handle_event("activate", %{"id" => id}, socket) do
    cards = activate(socket.assigns.cards, id)

    active_cards = cards |> Enum.filter(& &1.active)

    cards =
      if active_cards |> length == 2 do
        types = Enum.uniq_by(active_cards, fn card -> card.language end)

        if types |> length == 1 do
          match(cards, active_cards)
        else
          cards
          |> Enum.map(fn card ->
            if active_cards |> Enum.member?(card) do
              Process.send_after(self(), {:delayed_update, active_cards}, 1000)

              %{card | active: false, resetting: true}
            else
              card
            end
          end)
        end
      else
        cards
      end

    {:noreply, assign(socket, cards: cards)}
  end

  def handle_info({:delayed_update, active_cards}, socket) do
    cards = socket.assigns.cards

    ids = active_cards |> Enum.map(fn card -> card.id end)

    cards =
      cards
      |> Enum.map(fn card ->
        if ids |> Enum.member?(card.id) do
          %{card | resetting: false}
        else
          card
        end
      end)

    {:noreply, assign(socket, cards: cards)}
  end

  defp match(cards, match) do
    [%{id: fst_id}, %{id: snd_id}] = match

    cards
    |> Enum.map(fn
      %{id: ^fst_id} = card -> %{card | active: false, solved: true}
      %{id: ^snd_id} = card -> %{card | active: false, solved: true}
      card -> card
    end)
  end

  defp activate(cards, id) do
    cards
    |> Enum.map(fn
      %{id: ^id} = card -> %{card | active: true}
      card -> card
    end)
  end

  defp get_cards() do
    ["python", "java", "c", "ruby", "javascript", "haskell", "go", "rust"]
    |> Enum.flat_map(&Memory.Card.new_pair/1)
    |> Enum.shuffle()
  end
end
