defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equal?(a, b) -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(a, b) when length(a) > length(b), do: false
  defp sublist?(a, b = [ _ | tail ]) do
    equal?(a, Enum.take(b, length(a))) or sublist?(a, tail)
  end

  defp equal?(a, b) do
    a === b
  end
end
