defmodule KinoOpenAI.OpenAICell do
  @moduledoc false

  use Kino.JS, assets_path: "lib/assets/kino_openai"
  use Kino.JS.Live
  use Kino.SmartCell, name: "OpenAI Task"

  @impl true
  def init(attrs, ctx) do
    fields = %{
      "openai_secret_key" => attrs["openai_secret_key"] || "",
      "openai_organization_id" => attrs["openai_organization_id"] || "",
      "prompt" => attrs["prompt"] || ""
    }

    ctx = assign(ctx, fields: fields)
    {:ok, ctx}
  end

  @impl true
  def handle_connect(ctx) do
    {:ok, %{fields: ctx.assigns.fields}, ctx}
  end

  @impl true
  def handle_event("update_openai_secret_key", value, ctx) do
    broadcast_event(ctx, "update_openai_secret_key", value)
    ctx = update(ctx, :fields, &Map.merge(&1, %{"openai_secret_key" => value}))
    {:noreply, ctx}
  end

  @impl true
  def handle_event("update_openai_organization_id", value, ctx) do
    broadcast_event(ctx, "update_openai_organization_id", value)
    ctx = update(ctx, :fields, &Map.merge(&1, %{"openai_organization_id" => value}))
    {:noreply, ctx}
  end

  @impl true
  def handle_event("update_prompt", value, ctx) do
    ctx = update(ctx, :fields, &Map.merge(&1, %{"prompt" => value}))
    {:noreply, ctx}
  end

  @impl true
  def to_attrs(ctx) do
    ctx.assigns.fields
  end

  @impl true
  def to_source(attrs) do
    required_fields = ~w(prompt)

    if all_fields_filled?(attrs, required_fields) do
      quote do
        case OpenAI.Completions.create("text-davinci-003",unquote(attrs["prompt"])) do
          {:ok, resp} -> resp
          {:error, error} -> error
        end
      end
      |> Kino.SmartCell.quoted_to_string()
    else
      "Sorry, you're missing some details to make the full request"
      |> Kino.SmartCell.quoted_to_string()
    end
  end

  def all_fields_filled?(attrs, keys) do
    Enum.all?(keys, fn key -> attrs[key] not in [nil, ""] end)
  end
end
