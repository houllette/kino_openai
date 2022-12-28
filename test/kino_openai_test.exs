defmodule KinoOpenaiTest do
  use ExUnit.Case, async: true

  import Kino.Test

  setup :configure_livebook_bridge

  test "supplies its hardcoded source" do
    {_kino, source} = start_smart_cell!(KinoOpenai.OpenaiCell, %{})

    assert source ==
             """
             IO.puts("Not ready reading drive A")
             IO.puts("Abort, Retry, Fail?")\
             """
  end
end
