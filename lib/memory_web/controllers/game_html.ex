defmodule MemoryWeb.GameHTML do
  use MemoryWeb, :html

  embed_templates "game_html/*"

  attr :name, :string

  def greet(assigns) do
    ~H"""
    <h2>Hello World, from <%= @name %>!</h2>
    """
  end
end
