defmodule WhatsUp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WhatsUp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: WhatsUp.PubSub}
      # Start a worker by calling: WhatsUp.Worker.start_link(arg)
      # {WhatsUp.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: WhatsUp.Supervisor)
  end
end
