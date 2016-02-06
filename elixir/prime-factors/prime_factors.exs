defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), 
    do: []

  def factors_for(number), 
    do: factors_for(number, 2, [])

  defp factors_for(number, divisor, factors) when number < divisor * divisor,
    do: Enum.reverse([number | factors])

  defp factors_for(number, divisor, factors) when rem(number, divisor) == 0,
    do: factors_for (div number, divisor), divisor, [divisor | factors]

  defp factors_for(number, 2, factors),
    do: factors_for number, 3, factors

  defp factors_for(number, divisor, factors),
    do: factors_for number, divisor + 2, factors

end
