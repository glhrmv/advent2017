defmodule Advent2017.Day20 do
  @input File.read!("inputs/day20.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day20.Part1 do
  import Advent2017.Day20
  
  def run do
    input()
    |> IO.inspect
  end
end