defmodule Advent2017.Day12 do
  @input File.read!("inputs/day12.txt")
  
  def input do
    @input
  end
end

defmodule Advent2017.Day12.Part1 do
  import Advent2017.Day12
  
  def run do
    input()
    |> IO.inspect
  end
end
