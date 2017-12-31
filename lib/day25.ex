defmodule Advent2017.Day25 do
  @input File.read!("inputs/day25.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day25.Part1 do
  import Advent2017.Day25
  
  def run do
    input()
    |> IO.inspect
  end
end