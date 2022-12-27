defmodule KinoOpenaiTest do
  use ExUnit.Case
  doctest KinoOpenai

  test "greets the world" do
    assert KinoOpenai.hello() == :world
  end
end
