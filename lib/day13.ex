defmodule Advent2017.Day13 do
  @input File.read!("inputs/day13.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day13.Part1 do
  import Advent2017.Day13
  
  def run do
    input()
    |> IO.inspect
  end
end
