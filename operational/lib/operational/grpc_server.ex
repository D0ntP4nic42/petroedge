defmodule Operational.GRPCServer do
  use GRPC.Server,
    service: Petroedge.Operational.V1.OperationalDataService.Service

  def register_asset(_request, _stream) do
    unimplemented("RegisterAsset")
  end

  def get_asset(_request, _stream) do
    unimplemented("GetAsset")
  end

  def ingest_telemetry(_request, _stream) do
    unimplemented("IngestTelemetry")
  end

  def stream_telemetry(_request, _stream) do
    unimplemented("StreamTelemetry")
  end

  defp unimplemented(method) do
    raise GRPC.RPCError,
      status: :unimplemented,
      message: "method #{method} not implemented"
  end
end
