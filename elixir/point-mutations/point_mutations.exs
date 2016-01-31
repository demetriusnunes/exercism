defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2), 
    do: hamming_distance(strand1, strand2, 0)

  def hamming_distance(_,_), 
    do: nil

  defp hamming_distance([], [], count), 
    do: count

  defp hamming_distance([h1 | r1], [h2 | r2], count) when h1 != h2, 
    do: hamming_distance(r1, r2, count + 1)

  defp hamming_distance([h1 | r1], [h2 | r2], count), 
    do: hamming_distance(r1, r2, count)
end
