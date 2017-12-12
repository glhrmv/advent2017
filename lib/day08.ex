defmodule Advent2017.Day08 do
  @input File.read!("inputs/day08.txt")
  
  def input do
    @input
  end
  
  def parse_instructions(input) do
    [reg, op, arg, "if", ctarget, cop, carg] = String.split(input)
  end
end

defmodule Advent2017.Day08.Part1 do
  import Advent2017.Day08
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_instructions/1)
    |> IO.inspect
  end
end
