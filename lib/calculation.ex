defmodule RpnCalculator.Calculation do
  def operate(param_list) when param_list |> is_list do
    List.pop_at(param_list, -1)
    |> determine_operation_type
  end

  defp determine_operation_type(parsed_arguments) do
    {operator, values} = parsed_arguments
    case operator do
      "+"  -> sum_arguments(values)
      "sum"  -> sum_arguments(values)
      "add"  -> sum_arguments(values)
      "-"  -> subtract_arguments(values)
      "subtract" -> subtract_arguments(values)
      "x"  -> multiply_arguments(values)
      "multiply"  ->  multiply_arguments(values)
      "/"  ->  divide_arguments(values)
      "divide" ->  divide_arguments(values)
      _ -> "This operator is not yet supported."
    end
  end

  defp convert_arguments(values) when values |> is_list do
    values
    |> Enum.map(fn item -> handle_non_ints(item) end)
    |> Enum.filter(fn item -> item |> is_number end)
  end

  defp handle_non_ints(item) when item |> is_binary do
    check = item |> is_numeric
    case check do
      true -> item |> String.to_integer
      false -> nil
    end
  end

  defp is_numeric(str_value) when str_value |> is_binary do
    case Float.parse(str_value) do
      {_num, ""} -> true
      _          -> false
    end
  end

  def sum_arguments(values) when values |> is_list do
    values
    |> convert_arguments
    |> Enum.sum
  end

  def subtract_arguments(values) when values |> is_list do
    values
    |> convert_arguments
    |> Enum.reduce(fn(x, acc) -> acc - x end)
  end

  def multiply_arguments(values) when values |> is_list do
    values
    |> convert_arguments
    |> Enum.reduce(fn(x, acc) -> acc * x end)
  end

  def divide_arguments(values) when values |> is_list do
    values
    |> convert_arguments
    |> Enum.reduce(fn(x, acc) -> acc/x end)
  end
end