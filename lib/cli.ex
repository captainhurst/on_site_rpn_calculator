defmodule RpnCalculator.CLI do
  alias RpnCalculator.Calculation

  def main(args) do
    IO.puts Calculation.operate(args)
  end
end