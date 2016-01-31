defmodule Phone do
  @invalid_number "0000000000"

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw 
    |> to_char_list
    |> Enum.filter(&filter_alphanum/1)
    |> to_string
    |> check_11_digits
    |> check_length
  end

  defp filter_alphanum(d) do
    (d >= ?0 and d <= ?9) or (d >= ?a and d <= ?z) or (d >= ?A and d <= ?Z)
  end

  defp check_11_digits(number) do
    cond do
      String.length(number) != 11 -> number
      String.first(number) == "1" -> String.slice(number, 1..-1)
      true -> @invalid_number
    end
  end

  defp check_length(number) do
    if String.length(number) != 10, do: @invalid_number, else: number
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw 
    |> number
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw
    |> number
    |> format
  end

  defp format(n), do: "(#{area_code(n)}) #{String.slice(n, 3..5)}-#{String.slice(n, 6..9)}" 
end
