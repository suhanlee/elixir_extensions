defmodule ElixirExtensions.Core do
  @moduledoc """
  Extend Repo with some useful functions.
  Add this line to your repo:

    use ElixirExtensions.Core
  """
  defmacro __using__(_) do
    quote do
      import ElixirExtensions.Core.{MapExt, StringExt}
    end
  end
end
