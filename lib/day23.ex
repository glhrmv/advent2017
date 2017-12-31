defmodule Advent2017.Day23 do
  @input File.read!("inputs/day23.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day23.Part1 do
  import Advent2017.Day23
  
  def run do
    input()
    |> IO.inspect
  end
end