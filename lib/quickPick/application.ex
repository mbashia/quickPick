defmodule QuickPick.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      QuickPick.Repo,
      # Start the Telemetry supervisor
      QuickPickWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: QuickPick.PubSub},
      # Start the Endpoint (http/https)
      QuickPickWeb.Endpoint
      # Start a worker by calling: QuickPick.Worker.start_link(arg)
      # {QuickPick.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QuickPick.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuickPickWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
