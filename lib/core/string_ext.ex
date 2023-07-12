defmodule ElixirExtensions.Core.StringExt do
  @moduledoc """
  Functions to string truncate
  """

  @doc """
  Returns `string` as a slug or `nil` if it failed.

  ## Options

    * `:separator` - Replace whitespaces with this string. Leading, trailing or
    repeated whitespaces are trimmed. Defaults to `-`.
    * `:lowercase` - Set to `false` if you wish to retain capitalization.
    Defaults to `true`.
    * `:truncate` - Truncates slug at this character length, shortened to the
    nearest word.
    * `:ignore` - Pass in a string (or list of strings) of characters to ignore.

  ## Examples

      iex> slugify("Hello, World!")
      "hello-world"

      iex> slugify("Madam, I'm Adam", separator: "")
      "madamimadam"

      iex> slugify("StUdLy CaPs", lowercase: false)
      "StUdLy-CaPs"

      iex> slugify("Call me maybe", truncate: 10)
      "call-me"

      iex> slugify("你好，世界", ignore: ["你", "好"])
      "你好-shi-jie"

  """
  def slugify(string, options \\ []) do
    Slug.slugify(string, options)
  end

  @doc """
  Copied from https://github.com/ikeikeikeike/phoenix_html_simplified_helpers/blob/master/lib/phoenix_html_simplified_helpers/truncate.ex

  ## Examples

      iex> truncate("hello world", length: 5)
      "he..."

  """
  def truncate(text, options \\ []) do
    len = options[:length] || 30
    omi = options[:omission] || "..."

    cond do
      !String.valid?(text) ->
        text

      String.length(text) < len ->
        text

      true ->
        len_with_omi = len - String.length(omi)

        stop =
          if options[:separator] do
            rindex(text, options[:separator], len_with_omi) || len_with_omi
          else
            len_with_omi
          end

        "#{String.slice(text, 0, stop)}#{omi}"
    end
  end

  @doc false
  defp rindex(text, str, offset) do
    text = String.slice(text, 0, offset)
    reversed = String.reverse(text)
    matchword = String.reverse(str)

    case :binary.match(reversed, matchword) do
      {at, strlen} ->
        String.length(text) - at - strlen

      :nomatch ->
        nil
    end
  end
end
