defmodule FrClone.Repo do
  use Ecto.Repo,
    otp_app: :fr_clone,
    adapter: Ecto.Adapters.Postgres
end
