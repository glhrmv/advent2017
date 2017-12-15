defmodule Advent2017.Day15 do
  @input File.read!("inputs/day15.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day15.Part1 do
  import Advent2017.Day15
  
  def run do
    input()
    |> IO.inspect
  end
end