defmodule Advent2017.Day11 do
  @input File.read!("inputs/day11.txt")
  
  def input, do: @input
  
  def step({x, y}, dir) do
    case dir do
      "n"  -> {x, y - 1}
      "ne" -> {x + 1, y}
      "se" -> {x + 1, y + 1}
      "s"  -> {x, y + 1}
      "sw" -> {x - 1, y}
      "nw" -> {x - 1, y - 1}
    end
  end
  
  def distance({x, y}) do
    abs(x) + abs(y)
  end
  
  def process(list, data \\ {{0, 0}, 0})
  def process([], {{_x, _y} = pos, max}) do
    {distance(pos), max}
  end
  
  def process([curr | rest], {{_x, _y} = pos, max}) do
    pos = step(pos, curr)
    distance = distance(pos)
    process(rest, {pos, Enum.max([distance, max])})
  end
end

defmodule Advent2017.Day11.Part1and2 do
  import Advent2017.Day11
  
  def run do
    input()
    |> String.split(",", trim: true)
    |> process
    |> IO.inspect
  end
end
