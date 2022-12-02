defmodule Day2Part1 do
  def score(["A", "X"]), do: 1 + 3 # RR
  def score(["A", "Y"]), do: 2 + 6 # RP
  def score(["A", "Z"]), do: 3 + 0 # RS
  def score(["B", "X"]), do: 1 + 0 # PR
  def score(["B", "Y"]), do: 2 + 3 # PP
  def score(["B", "Z"]), do: 3 + 6 # PS
  def score(["C", "X"]), do: 1 + 6 # SR
  def score(["C", "Y"]), do: 2 + 0 # SP
  def score(["C", "Z"]), do: 3 + 3 # SS

  def solve(filename) do
    filename
    |> File.stream!
    |> Enum.map(&String.split/1)
    |> Enum.map(&score/1)
    |> Enum.sum
  end
end

defmodule Day2Part2 do
  def score(["A", "X"]), do: 3 + 0 # RS
  def score(["A", "Y"]), do: 1 + 3 # RR
  def score(["A", "Z"]), do: 2 + 6 # RP
  def score(["B", "X"]), do: 1 + 0 # PR
  def score(["B", "Y"]), do: 2 + 3 # PP
  def score(["B", "Z"]), do: 3 + 6 # PS
  def score(["C", "X"]), do: 2 + 0 # SP
  def score(["C", "Y"]), do: 3 + 3 # SS
  def score(["C", "Z"]), do: 1 + 6 # SR

  def solve(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&String.split/1)
    |> Enum.map(&score/1)
    |> Enum.sum()
  end
end
