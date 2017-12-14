defmodule Advent2017.Day07 do
  @input File.read!("inputs/day07.txt")
  
  def input, do: @input
end

defmodule Advent2017.Day07.Part1 do
  import Advent2017.Day07
  
  def run do
    input()
    |> IO.inspect
  end
end
