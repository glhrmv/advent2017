defmodule Advent2017.Day05 do
  @input File.read!("inputs/day05.txt") |> String.split("\n", trim: true)
  
  def input do
    @input
  end
  
  def jump(instructions) do
    jump(instructions, 0, 0)
  end
  
  defp jump(instructions, i, count) when i >= length(instructions) or i < 0 do
    count
  end
  
  defp jump(instructions, i, count) do
    jump_offset = Enum.at(instructions, i)
    instructions = List.update_at(instructions, i, &(&1 + 1))
    
    jump(instructions, jump_offset + i, count + 1)
  end
end

defmodule Advent2017.Day05.Part1 do
  import Advent2017.Day05
  
  def run do
    input()
    |> Enum.map(&String.to_integer/1)
    |> jump
    |> IO.inspect
  end
end