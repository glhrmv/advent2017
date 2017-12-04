defmodule Advent2017.Day01 do
  @input File.read!("inputs/day01.txt")
  
  def put_first_in_last(list) do
    # Take the first element of the list and
    # put it into the end of the list
    list ++ Enum.take(list, 1)
    |> Enum.drop(1)
  end
  
  def validate_chunks(list) do
    # Filter out the paired chunks that
    # don't have the same elements
    list
    |> Enum.filter(fn [a, b] -> a == b end)
  end
  
  def flatten_chunks(list) do
    # We only care about the value of the
    # pairs in the chunk, so we might as well
    # just keep the first element
    list 
    |> Enum.map(fn [a, _] -> a end)
  end
  
  def input do
    @input
  end
end

defmodule Advent2017.Day01.Part1 do
  import Advent2017.Day01
  
  def run do
    input()
    |> String.split("", trim: true)
    |> put_first_in_last
    |> Enum.chunk_every(2, 1, :discard)
    |> validate_chunks
    |> flatten_chunks
    |> Enum.map(&String.to_integer(&1))
    |> Enum.sum
    |> IO.inspect
  end
end