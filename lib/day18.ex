defmodule Advent2017.Day18 do
  @input File.read!("inputs/day18.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day18.Part1 do
  import Advent2017.Day18
  
  def run do
    input()
    |> IO.inspect
  end
end