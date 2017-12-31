defmodule Advent2017.Day24 do
  @input File.read!("inputs/day24.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day24.Part1 do
  import Advent2017.Day24
  
  def run do
    input()
    |> IO.inspect
  end
end