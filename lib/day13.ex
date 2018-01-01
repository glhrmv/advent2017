defmodule Advent2017.Day13 do
  @input File.read!("inputs/day13.txt")
  
  def input, do: @input
  
  def caught?({depth, range}, delay) do
    rem(depth + delay, 2 * (range - 1)) == 0
  end
  
  def calculate_severity(list, acc \\ 0)
  def calculate_severity([{depth, range} | rest], acc) do
    severity = acc + depth * range
    
    calculate_severity(rest, severity)
  end
  
  def calculate_severity([], acc) do
    acc
  end
end

defmodule Advent2017.Day13.Part1 do
  import Advent2017.Day13
  
  def run do
    input()
    |> String.split("\n")
    |> Enum.map(fn line ->
      line 
      |> String.split(": ")
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple
    end)
    |> Enum.filter(&caught?(&1, 0))
    |> calculate_severity
    |> IO.inspect
  end
end
