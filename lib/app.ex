defmodule Election.Supervisor do
  @moduledoc false

  use Supervisor

  alias Election.Config

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(init_arg) do
    children = [
      {Election.Elector, init_arg}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
