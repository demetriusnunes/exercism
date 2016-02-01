defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @teenth 13..19

  @weekdays_by_number %{ 1 => :monday, 2 => :tuesday, 3 => :wednesday,
                    4 => :thursday, 5 => :friday, 6 => :saturday,
                    7 => :sunday }

  @schedule_count %{ :last => 1, :first => 1, :teenth => 1, 
                      :second => 2, :third => 3, :fourth => 4 }

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do

    day_finder = fn (day, count) ->
      dow = @weekdays_by_number[:calendar.day_of_the_week(year, month, day)]

      count = count + if dow == weekday and (schedule != :teenth or day in @teenth),
                        do: 1, 
                      else: 0

      if count == @schedule_count[schedule], 
        do: { :halt, { year, month, day } }, 
      else: { :cont, count }
    end

    last_day = :calendar.last_day_of_the_month(year, month)

    range = if schedule == :last, 
              do: Range.new(last_day, 1), 
            else: Range.new(1, last_day)
            
    Enum.reduce_while range, 0, day_finder
  end

end
