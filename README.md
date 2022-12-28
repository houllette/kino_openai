# KinoOpenAI

[OpenAI](https://openai.com/api/) integration with [Kino](https://github.com/livebook-dev/kino)
for [Livebook](https://github.com/livebook-dev/livebook)

Heavily inspired by [kino_slack](https://github.com/livebook-dev/kino_slack) and [kino_bumblebee](https://github.com/livebook-dev/kino_bumblebee), uses the [OpenAI](https://github.com/hernanat/open_ai_ex) library under the hood.

## Installation

To bring KinoOpenAI to Livebook all you need to do is `Mix.install/2`:

```elixir
Mix.install([
  {:kino_openai, "~> 0.1.0"}
])
```