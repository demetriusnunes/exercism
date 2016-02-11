defmodule Raindrops do
  @raindrop_vocab %{ 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    output = number
      |> factors_for
      |> Enum.dedup
      |> Enum.map(&(@raindrop_vocab[&1]))
      |> Enum.join

    if output == "", 
      do: Integer.to_string(number), 
    else: output
  end

  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  defp factors_for(1), 
    do: []

  defp factors_for(number), 
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
