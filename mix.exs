defmodule KinoOpenai.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "OpenAI integration with Livebook"

  def project do
    [
      app: :kino_openai,
      version: @version,
      description: @description,
      name: "KinoOpenai",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      mod: {KinoOpenAI.Application, []}
    ]
  end

  defp deps do
    [
      {:kino, "~> 0.8.0"},
      {:open_ai, "~> 0.1.3"}
    ]
  end

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/livebook-dev/kino_slack"
      }
    ]
  end
end
