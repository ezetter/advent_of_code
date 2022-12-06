defmodule Day5Part1 do
  def get_stacks(fs) do
    fs
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&tl/1)
    |> Enum.map(&Enum.take_every(&1, 4))
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn from -> Enum.filter(from, fn y -> y != " " end) end)
    |> Enum.with_index()
    |> Map.new(fn {v, i} -> {i + 1, v} end)
  end

  def parse_move(["move", from, "from", to, "to", num]) do
    {String.to_integer(from), String.to_integer(to), String.to_integer(num)}
  end

  def update_stacks(stacks, num, from, to) do
    new_stacks = Enum.split(Map.get(stacks, from), num)

    stacks
    |> Map.replace(from, elem(new_stacks, 1))
    |> Map.update!(to, fn cv -> Enum.reverse(elem(new_stacks, 0)) ++ cv end)
  end

  def solve(filename) do
    fs = File.stream!(filename)

    stacks =
      Enum.take_while(fs, &(not String.starts_with?(&1, " 1")))
      |> get_stacks

    Enum.drop_while(fs, &(not String.starts_with?(&1, "move")))
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&parse_move/1)
    |> Enum.reduce(stacks, fn {num, from, to}, stacks -> update_stacks(stacks, num, from, to) end)
    |> Map.values()
    |> Enum.map(&hd/1)
    |> Enum.join("")
  end
end

defmodule Day5Part2 do
  def get_stacks(fs) do
    fs
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&tl/1)
    |> Enum.map(&Enum.take_every(&1, 4))
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn from -> Enum.filter(from, fn y -> y != " " end) end)
    |> Enum.with_index()
    |> Map.new(fn {v, i} -> {i + 1, v} end)
  end

  def parse_move(["move", from, "from", to, "to", num]) do
    {String.to_integer(from), String.to_integer(to), String.to_integer(num)}
  end

  def update_stacks(stacks, num, from, to) do
    new_stacks = Enum.split(Map.get(stacks, from), num)

    stacks
    |> Map.replace(from, elem(new_stacks, 1))
    |> Map.update!(to, fn cv -> elem(new_stacks, 0) ++ cv end)
  end

  def solve(filename) do
    fs = File.stream!(filename)

    stacks =
      Enum.take_while(fs, &(not String.starts_with?(&1, " 1")))
      |> get_stacks

    Enum.drop_while(fs, &(not String.starts_with?(&1, "move")))
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&parse_move/1)
    |> Enum.reduce(stacks, fn {num, from, to}, stacks -> update_stacks(stacks, num, from, to) end)
    |> Map.values()
    |> Enum.map(&hd/1)
    |> Enum.join("")
  end
end
