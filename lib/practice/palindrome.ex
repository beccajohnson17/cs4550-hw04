defmodule Practice.Palindrome do
  @moduledoc false

  @doc """
  https://elixirschool.com/en/lessons/basics/documentation/
  and https://elixirschool.com/en/lessons/advanced/typespec
  https://hexdocs.pm/elixir/typespecs.html#the-string-type
  used to documentation information and
  https://hexdocs.pm/elixir/String.html
  used for elixir functions.

  Returns true if a given word is a palindrome (has the same spelling backwards).
  Design decision: case should not affect output.

  ## Parameters

    - word: the word that is to be evaluated for a palindrome

  ## Examples

      iex> Practice.palindrome?("hannah")
      true

      iex> Practice.palindrome?("HANnah")
      true

      iex> Practice.palindrome?("collywobbles")
      false
  """

  @spec palindrome?(String.t()) :: boolean
  def palindrome?(word) do
    word_lower_case = String.downcase(word)
    word_lower_case == String.reverse(word_lower_case)
  end
end

