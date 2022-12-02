"data/d1lg.txt"
|> File.stream!()
|> Enum.map(&String.trim/1)
|> Enum.chunk_by(&(&1 != ""))
|> Enum.filter(&(&1 != [""]))
|> Enum.map(&Enum.map(&1, fn num -> String.to_integer(num) end))
|> Enum.map(&Enum.sum/1)
|> Enum.sort()
|> Enum.slice(-3..-1)
|> Enum.sum()
|> IO.inspect()

# "data/d1lg.txt"
# |> File.stream!
# |> Enum.map(&Integer.parse/1)
# |> Enum.chunk_by(&(&1 != :error))
# |> Enum.filter(&(&1 != [:error]))
# |> Enum.map(&Enum.map(&1, fn {num, _} -> num end))
# |> Enum.map(&Enum.sum/1)
# |> Enum.max
# |> IO.inspect

# "data/d1lg.txt"
# |> File.stream!
# |> Enum.map(&String.trim/1)
# |> Enum.chunk_by(&(&1 != ""))
# |> Enum.filter(&(&1 != [""]))
# |> Enum.map(&Enum.map(&1, fn num -> String.to_integer(num) end))
# |> Enum.map(&Enum.sum/1)
# |> Enum.max
# |> IO.inspect
