defmodule Advent2017.Day02 do
  defmodule Part1 do
    @input File.read!("inputs/day02.txt")
    
    def run do
      @input
      |> parse
      |> Enum.map(&row_difference/1)
      |> Enum.sum
      |> IO.inspect
    end
    
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
  end
end