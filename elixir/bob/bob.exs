defmodule Bob do
  def hey(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      all_caps?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp all_caps?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp empty?(input) do
    String.length(String.strip(input)) == 0
  end
end
