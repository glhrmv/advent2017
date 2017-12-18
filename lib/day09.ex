defmodule Advent2017.Day09 do
  @input File.read!("inputs/day09.txt")
  
  def input, do: @input
  
  def count_score(_list, score \\ 1)
  def count_score(["{" | rest], score) do
    score + count_score(rest, score + 1)
  end
  
  def count_score(["}" | rest], score), do: count_score(rest, score - 1)
  def count_score(["<" | rest], score), do: garbage(rest, score)
  def count_score(["," | rest], score), do: count_score(rest, score)
  def count_score(["" | rest], score), do: count_score(rest, score)
  def count_score([], _score), do: 0

  def garbage(["!", _ | rest], score), do: garbage(rest, score)
  def garbage([">" | rest], score), do: count_score(rest, score)
  def garbage([_ | rest], score), do: garbage(rest, score)
end

defmodule Advent2017.Day09.Part1 do
  import Advent2017.Day09
  
  def run do
    input()
    |> String.split("", trim: true)
    |> count_score
    |> IO.inspect
  end
end