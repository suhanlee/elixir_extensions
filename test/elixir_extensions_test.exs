defmodule ElixirExtensionsTest do
  use ExUnit.Case
  doctest ElixirExtensions

  test "core ext import test" do
    use ElixirExtensions
    assert truncate("hello world") == "hello world"
  end
end
