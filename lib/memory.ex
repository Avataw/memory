defmodule Memory do
  @moduledoc """
  Memory keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defmodule Card do
    @valid_types [:logo, :code]
    defstruct id: "", language: "", type: nil

    def new(language, type), do: %Card{id: Ecto.UUID.generate(), language: language, type: type}

    def new_pair(language) do
      [
        new(language, :logo),
        new(language, :code)
      ]
    end

    def matches?({first_language, first_type}, {second_language, second_type}) do
      first_language == second_language && first_type != second_type
    end
  end
end
