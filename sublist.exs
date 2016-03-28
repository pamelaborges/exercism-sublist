defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare([],[]), do: :equal
  def compare([],_), do: :sublist
  def compare(_,[]), do: :superlist
  def compare(a, b) do
      cond do
        a === b -> :equal
        contains?(a,b) -> :superlist
        contains?(b,a) -> :sublist
        true -> :unequal
      end
  end

  defp contains?(list1, list2) do
      count_list2 = Enum.count(list2)
      count_list1 = Enum.count(list1)
      cond do
        count_list2 > count_list1 -> false
        Enum.take(list1, count_list2) === list2 -> true
        true -> contains?(tl(list1), list2)
      end
  end
end
