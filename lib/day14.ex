defmodule Advent2017.Day14 do
  @input File.read!("inputs/day14.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day14.Part1 do
  import Advent2017.Day14
  
  def run do
    input()
    |> IO.inspect
  end
end
