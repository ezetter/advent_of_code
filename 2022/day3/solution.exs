defmodule Day3Part1 do
  def get_compartments(s) do
    mp = div(String.length(s), 2)

    String.graphemes(s)
    |> (&[Enum.slice(&1, 0, mp), Enum.slice(&1, mp, mp)]).()
  end

  def get_duplicates([c1, c2]) do
    MapSet.intersection(MapSet.new(c1), MapSet.new(c2))
    |> MapSet.to_list()
  end

  def priority_map do
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    |> String.graphemes()
    |> Enum.with_index()
    |> Map.new(fn {v, i} -> {v, i + 1} end)
  end

  def get_priority(items) do
    m = priority_map()

    Enum.map(items, &m[&1])
    |> Enum.sum()
  end

  def solve(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&get_compartments/1)
    |> Enum.map(&get_duplicates/1)
    |> Enum.map(&get_priority/1)
    |> Enum.sum()
  end
end

defmodule Day3Part2 do
  def find_badge(group) do
    group
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> MapSet.to_list()
  end

  def solve(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.chunk_every(3)
    |> Enum.map(&find_badge/1)
    |> Enum.map(&Day3Part1.get_priority/1)
    |> Enum.sum()
  end
end
