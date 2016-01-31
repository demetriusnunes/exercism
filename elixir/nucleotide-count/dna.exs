defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(nucleotide)

    strand
    |> histogram
    |> Map.get(nucleotide)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    strand
    |> Enum.map(&(validate/1))
    |> Enum.reduce(Map.new(@nucleotides, &({&1, 0})), 
      fn (nucl, map) ->
        %{ map | nucl => map[nucl] + 1 } 
      end)
  end

  defp validate(nucl) when nucl in @nucleotides, do: nucl
  defp validate(_), do: raise ArgumentError

end
