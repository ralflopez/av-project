defmodule AvProject.Repo do
  use Ecto.Repo,
    otp_app: :av_project,
    adapter: Ecto.Adapters.Postgres
end
