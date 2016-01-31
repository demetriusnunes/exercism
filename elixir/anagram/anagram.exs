defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&(anagram?(&1, base))) 
  end

  defp get_key(word) do
    word 
    |> String.downcase
    |> to_char_list
    |> Enum.sort
  end

  defp anagram?(candidate, base) do
    String.downcase(candidate) !== String.downcase(base) 
      and get_key(candidate) === get_key(base)
  end
end
