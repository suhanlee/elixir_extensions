defmodule ElixirExtensions do
  @moduledoc """
  Documentation for `ElixirExtensions`.
  """
  @doc false
  defmacro __using__(_) do
    quote do
      use ElixirExtensions.Core
    end
  end
end
