defmodule RemoveBug.Repo do
  use Ecto.Repo,
    otp_app: :remove_bug,
    adapter: Ecto.Adapters.Postgres
end
