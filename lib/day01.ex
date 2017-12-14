defmodule Advent2017.Day01 do
  @input File.read!("inputs/day01.txt")
  
  def input, do: @input
  
  def put_first_in_last(list) do
    # Take the first element of the list and
    # put it into the end of the list
    list ++ Enum.take(list, 1)
    |> Enum.drop(1)
  end
  
  def validate_paired_chunks(list) do
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
  
  def double_and_zip(list) do
    # Shift the input list from its
    # halfway point until the end
    half_of_list = div(length(list), 2)
    shifted = Enum.slice(list ++ list, half_of_list, length(list))
    
    # Partner every digit with its 
    # "halfway-round" digit
    List.zip([list, shifted])
    |> Enum.map(fn {a, b} -> [a, b] end)
  end
end

defmodule Advent2017.Day01.Part1 do
  import Advent2017.Day01
  
  def run do
    input()
    |> String.split("", trim: true)
    |> put_first_in_last
    |> Enum.chunk_every(2, 1)
    |> validate_paired_chunks
    |> flatten_chunks
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
    |> IO.inspect
  end
end

defmodule Advent2017.Day01.Part2 do
  import Advent2017.Day01
  
  def run do
    input()
    |> String.split("", trim: true)
    |> double_and_zip
    |> validate_paired_chunks
    |> flatten_chunks
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
    |> IO.inspect
  end
end