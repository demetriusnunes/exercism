defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    [div4, div100, div400 ] = [4, 100, 400] 
      |> Enum.map(&(rem(year, &1) === 0))

    div4 and ((not div100) or div400)    
  end
end
