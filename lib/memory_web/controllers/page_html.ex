defmodule MemoryWeb.PageHTML do
  use MemoryWeb, :html
  import MemoryWeb.Navigation

  embed_templates "page_html/*"
end
