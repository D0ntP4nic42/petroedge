import Config

config :operational, Operational.Repo,
  pool_size: 10,
  show_sensitive_data_on_connection_error: false

if config_env() == :test do
  import_config "test.exs"
end
