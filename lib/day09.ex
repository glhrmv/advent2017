defmodule Advent2017.Day09 do
  @input File.read!("inputs/day09.txt")
  
  def input do
    @input
  end
end

defmodule Advent2017.Day09.Part1 do
  import Advent2017.Day09
  
  def run do
    input()
    |> IO.inspect
  end
end
