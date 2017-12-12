defmodule Advent2017.Day11 do
  @input File.read!("inputs/day11.txt")
  
  def input do
    @input
  end
end

defmodule Advent2017.Day11.Part1 do
  import Advent2017.Day11
  
  def run do
    input()
    |> IO.inspect
  end
end
