defmodule Operational.MixProject do
  use Mix.Project

  def project do
    [
      app: :operational,
      version: "0.1.0",
      elixir: "~> 1.20",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Operational.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.14"},
      {:gun, "~> 2.4.0"},
      {:grpc, "~> 1.0"},
      {:grpc_server, "~> 1.0"},
      {:protobuf, "~> 0.17"},
      {:protobuf_generate, "~> 0.2", only: [:dev, :test]},
      {:postgrex, "~> 0.22"}
    ]
  end

  defp aliases do
    [
      "proto.generate": [
        "protobuf.generate --output-path=lib --include-path=proto/petroedge/operational/v1 --plugin=ProtobufGenerate.Plugins.GRPC operational_data.proto",
        "format"
      ]
    ]
  end
end
