defmodule Practice.Factor do
@moduledoc false

  @doc """
  # https://stackoverflow.com/questions/54790570/modulo-operator-in-elixir
  for modulo elxir function.
  https://stackoverflow.com/questions/35528875/add-new-element-to-list
  for debugging (adding list to a list)
  Made design decision for input of 1 to return 1 -- I wasn't entirely sure if the math
  was correct here but any number less than 4 returns only itself

  Returns a list of prime numbers from the given positive number.

  ## Parameters

    - num: integer (cannot be float) whose prime numbers will be listed out, must be non negative
    & greater than 0, per the definition of prime numbers.

  ## Examples

      iex> Practice.palindrome?(2)
      [2]

      iex> Practice.palindrome?(25)
      [5,5]

       iex> Practice.palindrome?(100)
      [2,2,5,5]


  """

  @spec factor(integer) :: [integer]
  def factor(num) do
      factor_helper(num, 2, [])
    end

    def factor_helper(num, t, list) do
        cond do
          num < t * t -> list++[num]
          rem(num, t) === 0 -> factor_helper(div(num, t), t, list++[t])
          true -> factor_helper(num, t+1, list)
    end
  end
end

