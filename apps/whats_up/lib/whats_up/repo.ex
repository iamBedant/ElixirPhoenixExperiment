defmodule WhatsUp.Repo do
  use Ecto.Repo,
    otp_app: :whats_up,
    adapter: Ecto.Adapters.Postgres
end
