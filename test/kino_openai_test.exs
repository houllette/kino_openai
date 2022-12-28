defmodule KinoOpenaiTest do
  use ExUnit.Case, async: true

  import Kino.Test

  setup :configure_livebook_bridge

  test "supplies error with no inputs" do
    {_kino, source} = start_smart_cell!(KinoOpenAI.OpenAICell, %{})

    assert source == "\"Sorry, you're missing some details to make the full request\""
  end
end
