defmodule Advent2017.Day06 do
  @input File.read!("inputs/day06.txt")
  
  def input, do: @input
  
  def redistribute_until_repeat(banks, log \\ MapSet.new) do
    updated_banks = redistribute(banks)
    
    cond do
      MapSet.member?(log, updated_banks) ->
        MapSet.size(log) + 1
      true ->
        updated_banks
        |> redistribute_until_repeat(MapSet.put(log, updated_banks))
    end
  end

  defp redistribute(banks) do
    {index, blocks} = largest(banks)

    banks
    |> Map.put(index, 0)
    |> distribute(blocks, index + 1)
  end

  defp distribute(banks, 0, _index), do: banks
  defp distribute(banks, blocks, index) when index >= map_size(banks), do
    distribute(banks, blocks, 0)
  end
  defp distribute(banks, blocks, index) do
    banks
    |> Map.put(index, banks[index] + 1)
    |> distribute(blocks - 1, index + 1)
  end

  defp largest(banks) do
    banks
    |> Enum.sort(fn ({index_a, blocks_a}, {index_b, blocks_b}) ->
      blocks_a > blocks_b or (blocks_a == blocks_b and index_a < index_b)
    end)
    |> Enum.at(0)
  end
end

defmodule Advent2017.Day06.Part1 do
  import Advent2017.Day06
  
  def run do
    input()
    |> String.split("\t", trim: true)
    |> Enum.with_index
    |> Enum.reduce(%{}, fn({n, index}, a) ->
      Map.put(a, index, String.to_integer(n))
    end)
    |> redistribute_until_repeat
    |> IO.inspect
  end
end