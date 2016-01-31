defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  defp count([ _ | rest], acum), do: count(rest, acum + 1)
  defp count([], acum), do: acum

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([head | rest], reversed), do: reverse(rest, [head | reversed])    
  defp reverse([], reversed), do: reversed

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, [])
  defp map([head | rest], f, mapped), do: map(rest, f, [ f.(head) | mapped ])
  defp map([], _, mapped), do: reverse(mapped)    

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])
  defp filter([head | rest], f, filtered), do: filter(rest, f, if(f.(head), do: [ head | filtered ], else: filtered))
  defp filter([], _, filtered), do: reverse(filtered)    

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([ head | rest ], acc, f), do: reduce(rest, f.(head, acc), f)
  def reduce([], acc, _), do: acc

  @spec append(list, list) :: list
  def append(a, b), do: append(a, b, reverse(a))
  defp append(a, [head | rest], result), do: append(a, rest, [ head | result])    
  defp append(_, [], result), do: reverse(result)

  @spec concat([[any]]) :: [any]
  def concat(ll), do: concat(ll, [])
  defp concat([[head | rest] | erest], result), do: concat([ rest | erest ], [ head | result ])
  defp concat([[] | erest], result), do: concat(erest, result)
  defp concat([], result), do: reverse(result)
end