defmodule AvProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AvProjectWeb.Telemetry,
      # Start the Ecto repository
      AvProject.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AvProject.PubSub},
      # Start Finch
      {Finch, name: AvProject.Finch},
      # Start the Endpoint (http/https)
      AvProjectWeb.Endpoint
      # Start a worker by calling: AvProject.Worker.start_link(arg)
      # {AvProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AvProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AvProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
