defmodule Advent2017.Day22 do
  @input File.read!("inputs/day22.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day22.Part1 do
  import Advent2017.Day22
  
  def run do
    input()
    |> IO.inspect
  end
end