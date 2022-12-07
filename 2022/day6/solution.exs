defmodule Day6 do
  def find_start([], _, _, _, _), do: -1

  def find_start(_, _, pos, _, true), do: pos

  def find_start(data, last, pos, smm_len, false) do
    is_start = last |> MapSet.new() |> MapSet.to_list() |> length == smm_len
    find_start(tl(data), tl(last) ++ [hd(data)], pos + 1, smm_len, is_start)
  end

  def solve(filename, smm_len) do
    {:ok, data} = File.read(filename)

    data
    |> String.graphemes()
    |> (&find_start(
          Enum.slice(&1, smm_len..-1),
          Enum.slice(&1, 0..(smm_len - 1)),
          smm_len - 1,
          smm_len,
          false
        )).()
  end
end
