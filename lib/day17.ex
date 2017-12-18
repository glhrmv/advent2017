defmodule Advent2017.Day17 do
  @input File.read!("inputs/day17.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day17.Part1 do
  import Advent2017.Day17
  
  def run do
    input()
    |> IO.inspect
  end
end