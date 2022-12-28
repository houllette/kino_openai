defmodule KinoOpenAI.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Kino.SmartCell.register(KinoOpenAI.OpenAICell)

    children = []
    opts = [strategy: :one_for_one, name: KinoOpenAI.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
