defmodule Binary do
  import :math

  @binary_map %{ "0" => 0, "1" => 1}
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
  
    string 
    |> String.codepoints
    |> Enum.map(&(@binary_map[&1]))
    |> Enum.reduce_while({0, String.length(string) - 1}, &convert_digit/2)
    |> elem(0)
  end

  defp convert_digit(digit, { acum, exp }) when digit == nil,
    do: { :halt, { 0 } }

  defp convert_digit(digit, { acum, exp }), 
    do: { :cont, { acum + (digit * round(pow(2, exp))), exp-1 } }
end
