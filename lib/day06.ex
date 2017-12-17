defmodule Advent2017.Day06 do
  @input File.read!("inputs/day06.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day06.Part1 do
  import Advent2017.Day06
  
  def run do
    input()
    |> String.split("\t")
    |> IO.inspect
  end
end