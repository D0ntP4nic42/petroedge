defmodule Operational.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children =
      []
      |> maybe_add_repo()
      |> maybe_add_grpc_server()

    opts = [strategy: :one_for_one, name: Operational.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp maybe_add_repo(children) do
    if Application.get_env(:operational, :start_repo, true) do
      [Operational.Repo | children]
    else
      children
    end
  end

  defp maybe_add_grpc_server(children) do
    if Application.get_env(:operational, :start_grpc, true) do
      children ++ [grpc_server_child()]
    else
      children
    end
  end

  defp grpc_server_child do
    {GRPC.Server.Supervisor,
     endpoint: Operational.GRPCEndpoint, port: grpc_port(), start_server: true}
  end

  defp grpc_port do
    System.get_env("GRPC_PORT", "50051")
    |> String.to_integer()
  end
end
