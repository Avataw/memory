defmodule MemoryWeb.Layouts do
  use MemoryWeb, :html
  import MemoryWeb.Navigation

  embed_templates "layouts/*"
end
