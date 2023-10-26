defmodule Memory.Repo do
  use Ecto.Repo,
    otp_app: :memory,
    adapter: Ecto.Adapters.Postgres
end
