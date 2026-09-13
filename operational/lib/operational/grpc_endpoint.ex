defmodule Operational.GRPCEndpoint do
  use GRPC.Endpoint

  run(Operational.GRPCServer)
end
