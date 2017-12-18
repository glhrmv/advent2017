defmodule Advent2017.Day05 do
  @input File.read!("inputs/day05.txt")
  
  def input, do: @input
  
  def to_map(list) do
    to_map(%{}, Enum.with_index(list))
  end
  
  def to_map(map, [{value, index} | rest]) do
    to_map(Map.put(map, index, value), rest)
  end
  
  def to_map(map, []), do: map
  
  def jump(map, pos \\ 0, steps \\ 0) do
    if pos in Map.keys(map) do
      {offset, new_map} = Map.get_and_update(map, pos, &update_offset/1)

      jump(new_map, pos + offset, steps + 1)
    else 
      # We're out of bounds, so
      # return the amount of steps
      steps
    end
  end
  
  defp update_offset(offset) do
    {offset, offset + 1}
  end
end

defmodule Advent2017.Day05.Part1 do
  import Advent2017.Day05
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> to_map
    |> jump
    |> IO.inspect
  end
end
