defmodule Cn23.Repo do
  use Ecto.Repo,
    otp_app: :cn23,
    adapter: Ecto.Adapters.Postgres
end
