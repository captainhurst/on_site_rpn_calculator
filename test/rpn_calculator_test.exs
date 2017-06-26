defmodule RpnCalculatorTest do
  use ExUnit.Case
  doctest RpnCalculator
  alias RpnCalculator.Calculation

  setup do
    %{
      success_addition_args: ["1", "1", "+"],
      success_subtraction_args: ["1", "1", "-"],
      success_multiply_args: ["1", "1", "x"],
      success_divide_args: ["1", "1", "/"],
      test_arguments: ["1", "2", "3"],
      failure_args: ["1", "1", "b"]
    }
  end

  test "test end-to-end addition", state do
    assert Calculation.operate(state[:success_addition_args]) == 2
  end
  
  test "test end-to-end subtraction", state do
    assert Calculation.operate(state[:success_subtraction_args]) == 0
  end
  
  test "test end-to-end multiplication", state do
    assert Calculation.operate(state[:success_multiply_args]) == 1
  end

  test "test end-to-end division", state do
    assert Calculation.operate(state[:success_divide_args]) == 1
  end

  test "test end-to-end failure", state do
    assert Calculation.operate(state[:failure_args]) == "This operator is not yet supported."
  end

  test "test sum_arguments", state do
    assert Calculation.sum_arguments(state[:test_arguments]) == 6
  end

  test "test subtract_arguments", state do
    assert Calculation.subtract_arguments(state[:test_arguments]) == -4
  end

  test "test multiply_arguments", state do
    assert Calculation.multiply_arguments(state[:test_arguments]) == 6
  end

  test "test divide_arguments", state do
    assert Calculation.divide_arguments(state[:test_arguments]) == 0.16666666666666666
  end
end
