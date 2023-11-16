defmodule MemoryWeb.Card do
  # In Phoenix apps, the line is typically: use MyAppWeb, :live_component
  use MemoryWeb, :html

  def card(assigns) do
    ~H"""
    <div class="cursor-pointer w-80 h-56 bg-gray-500 hover:bg-gray-300">
      <div
        :if={@card.active || @card.solved || @card.resetting}
        class="flex justify-center items-center w-full h-full"
      >
        <%= if @card.type == :logo do %>
          <img src={"/images/#{@card.language}.png"} class="w-3/4 h-3/4 object-contain" />
        <% else %>
          <img src={"/images/#{@card.language}-code.png"} class="w-full h-full object-contain" />
        <% end %>
      </div>
    </div>
    """
  end
end
