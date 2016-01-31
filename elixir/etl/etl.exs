defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    Enum.reduce input, Map.new, &do_etl/2
  end

  defp do_etl({points, words}, map) do
    Enum.reduce words, map, fn (word, map) ->
      Map.put(map, String.downcase(word), points)
    end
  end
end
