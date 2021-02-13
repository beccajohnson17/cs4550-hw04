defmodule Practice.PracticeTest do
  use ExUnit.Case
  import Practice

  test "double some numbers" do
    assert double(4) == 8
    assert double(3.5) == 7.0
    assert double(21) == 42
    assert double(0) == 0
  end

  test "factor some numbers" do
    assert factor(5) == [5]
    assert factor(8) == [2,2,2]
    assert factor(12) == [2,2,3]
    assert factor(226037113) == [3449, 65537]
    assert factor(1575) == [3,3,5,5,7]
  end

  # test "evaluate some expressions" do
  #   assert calc("5") == 5
  #   assert calc("5 + 1") == 6
  #   assert calc("5 * 3") == 15
  #   assert calc("10 / 2") == 5
  #   assert calc("10 - 2") == 8
  #   assert calc("5 * 3 + 8") == 23
  #   assert calc("8 + 5 * 3") == 23
  # end
  # def eval_Postfix(postfix, stack) do
  #   if postfix == [] do
  #     # our finished evaluation! stack starts as empty and ends with solution
  #     hd(stack)
  #   else
  #     # start at front of postfix
  #     current_Value = hd(postfix)

  #     # if its an operator, pop off the previous values in stack and complete operation, putting solution back in stack
  #     if operator_vs_number(current_Value) == :op do
  #       op1 = hd(stack)
  #       op2 = hd(tl(stack))
  #       complete_Operation(current_Value, op1, op2, stack, postfix)
  #     else
  #       if operator_vs_number(current_Value) == :num do
  #         # if it's a number, put it in the stack and rerun
  #         eval_Postfix(tl(postfix), [parse_float(current_Value) | stack])
  #       end
  #     end
  #   end
  # end
  # def mdas(operator) do
  #   case operator do
  #     "*" -> 2
  #     "/" -> 2
  #     "+" -> 1
  #     "-" -> 1
  #   end
  # end

  # # helper function that assigns each char to one of the four operators, or else a number as the default
  # def operator_vs_number(loc) do
  #   case loc do
  #     "*" -> :op
  #     "/" -> :op
  #     "+" -> :op
  #     "-" -> :op
  #     _ -> :num
  #   end
  # end

  # test "test a calc helper" do
  #   assert convert_to_postfix(["2","+","2"]) == "2 2 +"
  # end

  test "determine if palindrome" do
    assert palindrome?("mom") == true
    assert palindrome?("Mom") == true
    assert palindrome?("RACecar") == true
    assert palindrome?("d") == true
    assert palindrome?("discord") == false
    assert palindrome?("aaadaaa") == true
  end
end
