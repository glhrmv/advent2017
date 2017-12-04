defmodule Advent2017.Day02 do
  @input File.read!("inputs/day02.txt")
  
  def parse(input) do
    input
    |> String.split("\n", trim: true) # Split line by line
    |> Enum.map(fn line -> 
      line 
      |> String.split # For each line, split on every whitespace
      |> Enum.map(&String.to_integer/1) # Turn the string values into numbers
    end)
  end
  
  def row_difference(row) do
    Enum.max(row) - Enum.min(row) # Difference between the max and min values
  end
  
  def divisible_elements(row) do
    even_elems = for x <- row, y <- row, x != y, rem(x, y) == 0, do: div(x, y)
    hd(even_elems)
  end
  
  def input do
    @input
  end
end

defmodule Advent2017.Day02.Part1 do
  import Advent2017.Day02
  
  def run do
    input()
    |> parse
    |> Enum.map(&row_difference/1)
    |> Enum.sum
    |> IO.inspect
  end
end

defmodule Advent2017.Day02.Part2 do
  import Advent2017.Day02
  
  def run do
    input()
    |> parse
    |> Enum.map(&divisible_elements/1)
    |> Enum.sum
    |> IO.inspect
  end
end