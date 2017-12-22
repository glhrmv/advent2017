defmodule Advent2017.Day21 do
  @input File.read!("inputs/day21.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day21.Part1 do
  import Advent2017.Day21
  
  def run do
    input()
    |> IO.inspect
  end
end