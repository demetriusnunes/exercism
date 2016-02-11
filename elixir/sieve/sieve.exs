defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    2..limit
    |> Enum.to_list
    |> sieve([])
  end

  defp sieve([], primes), do: Enum.reverse(primes)

  defp sieve([prime|candidates], primes) do
    candidates 
      |> Enum.reject(fn number -> rem(number, prime) == 0 end)        
      |> sieve([prime|primes])
  end

end
