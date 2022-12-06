defmodule Day4Part1 do
  def get_ranges(pair) do
    pair
    |> Enum.map(&String.split(&1, "-"))
    |> Enum.map(&Enum.map(&1, fn num -> String.to_integer(num) end))
  end

  def contains([[a, b], [c, d]]), do: (a <= c and b >= d) or (c <= a and d >= b)

  def solve(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&get_ranges/1)
    |> Enum.filter(&contains(&1))
    |> length()
  end
end

defmodule Day4Part2 do
  def get_ranges(pair) do
    pair
    |> Enum.map(&String.split(&1, "-"))
    |> Enum.map(&Enum.map(&1, fn num -> String.to_integer(num) end))
  end

  def contains([[a, b], [c, d]]) do
    (a >= c and a <= d) or (b >= c and b <= d) or
      (c >= a and c <= b) or (d >= a and d <= b)
  end

  def solve(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&Day4Part1.get_ranges/1)
    |> Enum.filter(&contains(&1))
    |> length()
  end
end
