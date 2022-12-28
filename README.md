# KinoOpenAI

[OpenAI](https://openai.com/api/) integration with [Kino](https://github.com/livebook-dev/kino)
for [Livebook](https://github.com/livebook-dev/livebook)

Heavily inspired by [kino_slack](https://github.com/livebook-dev/kino_slack) and [kino_bumblebee](https://github.com/livebook-dev/kino_bumblebee), uses the [OpenAI](https://github.com/hernanat/open_ai_ex) library under the hood.

## Installation

To bring KinoOpenAI to Livebook all you need to do is at it too `Mix.install/2` and set your session Evironment variables `OPEN_AI_API_KEY` and `OPEN_AI_ORGANIZATION_ID` (we need to add `LB_` to the variable names in the Setup section, but they are already added behind the scenes when you use the Livebook Secrets Manager)

```elixir
Mix.install(
  [
    {:kino_openai, "~> 0.1.0"}
  ],
  config: [
    open_ai: [
      api_key: System.get_env("LB_OPEN_AI_API_KEY"),
      organization: System.get_env("LB_OPEN_AI_ORGANIZATION_ID")
    ]
  ]
)
```