"data/d1lg.txt"
|> File.stream!
|> Enum.map(&Integer.parse/1)
|> Enum.chunk_by(&(&1 != :error))
|> Enum.filter(&(&1 != [:error]))
|> Enum.map(&Enum.map(&1, fn {num, _} -> num end))
|> Enum.map(&Enum.sum/1)
|> Enum.max
|> IO.inspect
