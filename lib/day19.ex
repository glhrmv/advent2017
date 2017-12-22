defmodule Advent2017.Day19 do
  @input File.read!("inputs/day19.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day19.Part1 do
  import Advent2017.Day19
  
  def run do
    input()
    |> IO.inspect
  end
end