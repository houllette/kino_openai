defmodule KinoOpenai.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Kino.SmartCell.register(KinoOpenai.OpenaiCell)

    children = []
    opts = [strategy: :one_for_one, name: KinoOpenai.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
