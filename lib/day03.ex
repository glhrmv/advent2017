defmodule Advent2017.Day03 do
  @input File.read!("inputs/day03.txt")
  
  def input do
    @input
  end
end

defmodule Advent2017.Day03.Part1 do
  import Advent2017.Day03
  
  def run do
    input()
    |> String.to_integer
    |> IO.inspect
  end
end