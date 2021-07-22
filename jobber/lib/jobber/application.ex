defmodule Jobber.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: Jobber.JobRunner}
    ]
    opts = [strategy: :one_for_one, name: Jobber.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
