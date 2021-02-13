defmodule Practice.Calc do
  @moduledoc false

  @doc """
  https://www.youtube.com/watch?v=MeRb_1bddWg&t=608s&ab_channel=mycodeschool
  https://www.youtube.com/watch?v=vq-nUF0G4fI&ab_channel=mycodeschool
  I followed these youtube tutorials (not copying code, but following pseudo code)
  https://www.tutorialspoint.com/elixir/elixir_decision_case.htm for switch case syntax

  """

  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  # helper function that returns MDAS priority (multiplication and divison before additon and subtraction)
  def mdas(operator) do
    case operator do
      "*" -> 2
      "/" -> 2
      "+" -> 1
      "-" -> 1
    end
  end

  # helper function that assigns each char to one of the four operators, or else a number as the default
  def operator_vs_number(loc) do
    case loc do
      "*" -> :op
      "/" -> :op
      "+" -> :op
      "-" -> :op
      _ -> :num
    end
  end

  def convert_to_postfix(characters) do
    IO.puts(characters)
    stack = []
    postfix_string_elements = []

    Enum.each(characters, fn char ->
      {
        if operator_vs_number(char) == :num do
          IO.puts(char)
          postfix_string_elements ++ [char]
        else
          if stack == [] do
            stack ++ char
          end

          Enum.each(stack, fn elem ->
            {
              if mdas(elem) >= mdas(char) do
                IO.puts(elem)
                stack ++ [elem]
              else
                IO.puts(elem)
                postfix_string_elements ++ [stack]
              end
            }
          end)
        end
      }
    end)

    Enum.join(postfix_string_elements)
  end

  def complete_Operation(operator, operand1, operand2, stack, postfix) do
    case operator do
      "*" -> eval_Postfix(tl(postfix), [operand2 * operand1 | tl(tl(stack))])
      "/" -> eval_Postfix(tl(postfix), [operand2 / operand1 | tl(tl(stack))])
      "+" -> eval_Postfix(tl(postfix), [operand2 + operand1 | tl(tl(stack))])
      "-" -> eval_Postfix(tl(postfix), [operand2 - operand1 | tl(tl(stack))])
    end
  end

  def eval_Postfix(postfix, stack) do
    if postfix == [] do
      # our finished evaluation! stack starts as empty and ends with solution
      hd(stack)
    else
      # start at front of postfix
      current_Value = hd(postfix)

      # if its an operator, pop off the previous values in stack and complete operation, putting solution back in stack
      if operator_vs_number(current_Value) == :op do
        op1 = hd(stack)
        op2 = hd(tl(stack))
        complete_Operation(current_Value, op1, op2, stack, postfix)
      else
        if operator_vs_number(current_Value) == :num do
          # if it's a number, put it in the stack and rerun
          eval_Postfix(tl(postfix), [parse_float(current_Value) | stack])
        end
      end
    end
  end

  @doc """

  ## Parameters

  Returns the solution to the arithmetic expression, following PEMDAS (MDAS, technically)
  Spaces must be included in entry to avoid error.


    - expr: expression to be calculated

  ## Examples

      iex> Practice.Calc.calc("2")
      2

      iex> Practice.Calc.calc("2 + 2")
      4

      iex> Practice.Calc.calc("2 + 3 * 5")
      17

  """

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    |> String.split()
    |> convert_to_postfix()
    |> eval_Postfix([])
  end
end

# Hint:
# expr
# |> split
# |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
# |> convert to postfix
# |> reverse to prefix
# |> evaluate as a stack calculator using pattern matching
