defmodule ScripthungryPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :scripthungry_phoenix,
    adapter: Ecto.Adapters.Postgres
end
