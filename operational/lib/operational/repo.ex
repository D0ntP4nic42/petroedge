defmodule Operational.Repo do
  use Ecto.Repo,
    otp_app: :operational,
    adapter: Ecto.Adapters.Postgres

  @impl true
  def init(_type, config) do
    {:ok, Keyword.put(config, :url, System.fetch_env!("DATABASE_URL"))}
  end
end
