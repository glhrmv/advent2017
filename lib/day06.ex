defmodule Advent2017.Day06 do
  @input File.read!("inputs/day06.txt") |> String.split("\t")
  
  def input do
    @input
  end
end

defmodule Advent2017.Day06.Part1 do
  import Advent2017.Day06
  
  def run do
    input()
    |> IO.inspect
  end
end