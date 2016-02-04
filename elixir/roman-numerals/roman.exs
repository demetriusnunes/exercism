defmodule Roman do

  @roman_numerals [
    { 1000, "M"   },
    { 900,  "CM"  },
    { 500,  "D"   },
    { 400,  "CD"  },
    { 100,  "C"   },
    { 90,   "XC"  },
    { 50,   "L"   },
    { 40,   "XL"  },
    { 10,   "X"   },
    { 9,    "IX"  },
    { 5,    "V"   },
    { 4,    "IV"  },
    { 1,    "I"   }
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    @roman_numerals
      |> Enum.reduce({ number, "" }, &convert/2)
      |> elem(1)
  end

  defp convert({ value, roman }, { number, result }) when number < value, 
    do: { number, result }

  defp convert({ value, roman }, { number, result }),
    do: convert { value, roman }, { number - value, result <> roman }

end
