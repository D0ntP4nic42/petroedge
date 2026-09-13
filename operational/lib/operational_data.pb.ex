defmodule Petroedge.Operational.V1.Asset do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:id, 1, type: :string)
  field(:name, 2, type: :string)
  field(:type, 3, type: :string)
  field(:location, 4, type: :string)
  field(:parent_id, 5, type: :string, json_name: "parentId")
end

defmodule Petroedge.Operational.V1.RegisterAssetRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:asset, 1, type: Petroedge.Operational.V1.Asset)
end

defmodule Petroedge.Operational.V1.RegisterAssetResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:asset, 1, type: Petroedge.Operational.V1.Asset)
end

defmodule Petroedge.Operational.V1.GetAssetRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:id, 1, type: :string)
end

defmodule Petroedge.Operational.V1.GetAssetResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:asset, 1, type: Petroedge.Operational.V1.Asset)
end

defmodule Petroedge.Operational.V1.IngestTelemetryRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:telemetry, 1, type: Petroedge.Operational.V1.TelemetryEnvelope)
end

defmodule Petroedge.Operational.V1.TelemetryEnvelope.MeasurementsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :double)
end

defmodule Petroedge.Operational.V1.TelemetryEnvelope do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:asset_id, 1, type: :string, json_name: "assetId")
  field(:observed_at, 2, type: Google.Protobuf.Timestamp, json_name: "observedAt")

  field(:measurements, 3,
    repeated: true,
    type: Petroedge.Operational.V1.TelemetryEnvelope.MeasurementsEntry,
    map: true
  )

  field(:source, 4, type: :string)
end

defmodule Petroedge.Operational.V1.IngestTelemetryResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:accepted, 1, type: :uint32)
end

defmodule Petroedge.Operational.V1.StreamTelemetryRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:asset_id, 1, type: :string, json_name: "assetId")
  field(:from, 2, type: Google.Protobuf.Timestamp)
end

defmodule Petroedge.Operational.V1.StreamTelemetryResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.17.0", syntax: :proto3

  field(:telemetry, 1, type: Petroedge.Operational.V1.TelemetryEnvelope)
end

defmodule Petroedge.Operational.V1.OperationalDataService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "petroedge.operational.v1.OperationalDataService",
    protoc_gen_elixir_version: "0.17.0"

  rpc(
    :RegisterAsset,
    Petroedge.Operational.V1.RegisterAssetRequest,
    Petroedge.Operational.V1.RegisterAssetResponse
  )

  rpc(
    :GetAsset,
    Petroedge.Operational.V1.GetAssetRequest,
    Petroedge.Operational.V1.GetAssetResponse
  )

  rpc(
    :IngestTelemetry,
    stream(Petroedge.Operational.V1.IngestTelemetryRequest),
    Petroedge.Operational.V1.IngestTelemetryResponse
  )

  rpc(
    :StreamTelemetry,
    Petroedge.Operational.V1.StreamTelemetryRequest,
    stream(Petroedge.Operational.V1.StreamTelemetryResponse)
  )
end

defmodule Petroedge.Operational.V1.OperationalDataService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Petroedge.Operational.V1.OperationalDataService.Service
end
