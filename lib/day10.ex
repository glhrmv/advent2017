defmodule Advent2017.Day10 do
  @input File.read!("inputs/day10.txt")
  
  def input do
    @input
  end
end

defmodule Advent2017.Day10.Part1 do
  import Advent2017.Day10
  
  def run do
    input()
    |> IO.inspect
  end
end
