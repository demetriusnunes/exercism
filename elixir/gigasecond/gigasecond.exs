defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime

  @seconds_1G 1000000000

	def from(datetime) do
    datetime
    |> :calendar.datetime_to_gregorian_seconds
    |> fn from -> from + @seconds_1G end.()
    |> :calendar.gregorian_seconds_to_datetime
	end
end
