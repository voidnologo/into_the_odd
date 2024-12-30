defmodule IntoTheOdd.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      IntoTheOddWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:into_the_odd, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: IntoTheOdd.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: IntoTheOdd.Finch},
      # Start a worker by calling: IntoTheOdd.Worker.start_link(arg)
      # {IntoTheOdd.Worker, arg},
      # Start to serve requests, typically the last entry
      IntoTheOddWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IntoTheOdd.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IntoTheOddWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
